output "name" {
  description = "The name of the SQL Instance Pool."
  value       = azapi_resource.this.name
}

output "resource" {
  description = "The SQL Instance Pool resource."
  value       = azapi_resource.this
}

output "resource_id" {
  description = "The ID of the SQL Instance Pool."
  value       = azapi_resource.this.id
}
