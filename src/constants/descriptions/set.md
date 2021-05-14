Column with elements from a set

Parameters:

* `type: set` - column type
* `set` (optional, default: NULL) - set of possible values, if NULL, will use a random set.
* `set_type` (optional, default: NULL) - type of random set, can be "integer", "numeric" or "string".
* `set_size` (optional, default: NULL) - integer, size of random set
* If set is random, you can add parameters required by type of set (eg, min, max, pattern, etc.)

Example:

```yaml
data_frame:
  columns:
    set_column_one:
      type: set
      set: ["aardvark", "elephant", "hedgehog"]
    set_column_two:
      type: set
      set_type: integer
      set_size: 3
      min: 2
      max: 10
```
