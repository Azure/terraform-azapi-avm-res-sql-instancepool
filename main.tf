# Data source to get the resource group
data "azurerm_resource_group" "parent" {
  name = var.resource_group_name
}

# SQL Instance Pool resource
resource "azapi_resource" "this" {
  type      = "Microsoft.Sql/instancePools@2024-05-01-preview"
  name      = var.name
  location  = var.location
  parent_id = data.azurerm_resource_group.parent.id
  tags      = var.tags

  body = {
    sku = {
      name     = var.sku.name
      tier     = var.sku.tier
      family   = var.sku.family
      capacity = var.sku.capacity
    }

    properties = {
      licenseType                = var.license_type
      subnetId                   = var.subnet_id
      vCores                     = var.vcores
      maintenanceConfigurationId = var.maintenance_configuration_id
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.lock.kind}")
  scope      = azapi_resource.this.id
  notes      = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  principal_id                           = each.value.principal_id
  scope                                  = azapi_resource.this.id
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  principal_type                         = each.value.principal_type
  role_definition_id                     = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? each.value.role_definition_id_or_name : null
  role_definition_name                   = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : each.value.role_definition_id_or_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}
