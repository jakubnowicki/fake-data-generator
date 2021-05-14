Generate column using custom function available in your environment.
Function should accept argument `size` and return a vector of length equal to it.

Parameters:

* `type: custom_column` - column type
* `custom_column_generator` - name of the function that will generate column.
* All parameters required by your custom function except `size`.

Example:

```r
return_repeated_value <- function(size, value) {
  rep(value, times = size)
}
```

```yaml
data_frame:
  columns:
    custom_column:
      type: custom_column
      custom_column_generator: return_repeated_value
      value: "Ask me about trilobites!"
```
