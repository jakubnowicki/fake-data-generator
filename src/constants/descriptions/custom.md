Generate column values using custom function available in your environment. Function should return a single value.

Parameters:

* `type: custom` - column type
* `custom_generator` - name of the function that will provide values.
* All parameters required by your custom function.

Example:

```r
return_sample_paste <- function(vector_of_values) {
  values <- sample(vector_of_values, 2)
  paste(values, collapse = "_")
}
```

```yaml
data_frame:
  columns:
    custom_column:
      type: custom
      custom_generator: return_sample_paste
      vector_of_values: ["a", "b", "c", "d"]
```
