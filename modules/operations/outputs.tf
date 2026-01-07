output "operation" {
  description = "The operation resource details."
  value       = var.operation_id != null ? data.azapi_resource.operation[0] : null
}
