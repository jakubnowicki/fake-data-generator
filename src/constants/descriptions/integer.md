Random integers from a range

Parameters:

* `type: integer` - column type
* `unique` (optional, default: FALSE) - boolean, should values be unique
* `min` (optional, default: 0) - integer, minimum value to occur in the column.
* `max` (optional, default: 999999) - integer, maximum value to occur in the column.

Example:

```yaml
data_frame:
  columns:
    integer_column:
      type: integer
      min: 2
      max: 10
```
