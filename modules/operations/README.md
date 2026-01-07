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
