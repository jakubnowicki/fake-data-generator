Random float numbers from a range

Parameters:

* `type: numeric` - column type
* `unique` (optional, default: FALSE) - boolean, should values be unique
* `min` (optional, default: 0) - numeric, minimum value to occur in the column.
* `max` (optional, default: 999999) - numeric, maximum value to occur in the column.

Example:

```yaml
data_frame:
  columns:
    numeric_column:
      type: numeric
      min: 2.12
      max: 10.3
```
