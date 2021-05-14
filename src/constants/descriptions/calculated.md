Calculate columns that depend on other columns. For examples check
[this configuration](https://github.com/jakubnowicki/fixtuRes/blob/master/examples/calculated_columns.yaml) and
[this R script with functions](https://github.com/jakubnowicki/fixtuRes/blob/master/examples/additional_functions.R).

Parameters:

* `type: calculated` - column type
* `formula` - calculation that has to be performed to obtain column

In general, formula can be a simple expression or a call of more complex
function. In both cases formula has to include names of the columns required for the calculations. When using a function, make sure that
it returns a vector of the same size as inputs.

Example:

```r
check_column <- function(column) {
  purrr::map_lgl(column, ~.x >= 10)
}
```

```yaml
data_frame:
  columns:
    basic_column:
      type: integer
      min: 1
      max: 10
    second_basic_column:
      type: integer
      min: 1
      max: 10
    calculated_column:
      type: calculated
      formula: basic_column + second_basic_column
    second_calculated_column:
      type: calculated
      formula: check_column(calculated_column)
```
