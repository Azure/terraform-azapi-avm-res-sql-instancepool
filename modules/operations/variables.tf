variable "instance_pool_id" {
  type        = string
  description = "The resource ID of the parent SQL Instance Pool."
  nullable    = false
}

variable "operation_id" {
  type        = string
  default     = null
  description = "The GUID identifier of the operation to query. If not provided, no operation will be queried."
}
