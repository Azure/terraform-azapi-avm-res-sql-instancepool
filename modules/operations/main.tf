# Operations submodule for SQL Instance Pool
# This module is for tracking long-running operations on the SQL Instance Pool

# Note: This is a read-only resource type for tracking operations
# Operations are created automatically by Azure when actions are performed on the instance pool
# This data source can be used to query operation status

data "azapi_resource" "operation" {
  count = var.operation_id != null ? 1 : 0

  name      = var.operation_id
  parent_id = var.instance_pool_id
  type      = "Microsoft.Sql/instancePools/operations@2024-05-01-preview"
}
