# Operations Submodule

This submodule provides access to operation tracking for SQL Instance Pools.

## Usage

```hcl
module "operation" {
  source = "../../modules/operations"

  instance_pool_id = azapi_resource.instance_pool.id
  operation_id     = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
}
```

## Notes

- Operations are automatically created by Azure when actions are performed on the instance pool
- This module is primarily for querying operation status
- The `operation_id` should be a GUID that identifies a specific operation

<!-- BEGIN_TF_DOCS -->

## Resources

| Name | Type |
|------|------|
| [azapi_resource.operation](https://registry.terraform.io/providers/hashicorp/azapi/latest/docs/data-sources/resource) | data source |
## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_pool_id"></a> [instance\_pool\_id](#input\_instance\_pool\_id) | The resource ID of the parent SQL Instance Pool. | `string` | n/a | yes |
| <a name="input_operation_id"></a> [operation\_id](#input\_operation\_id) | The GUID identifier of the operation to query. If not provided, no operation will be queried. | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_operation"></a> [operation](#output\_operation) | The operation resource details. |
<!-- END_TF_DOCS -->