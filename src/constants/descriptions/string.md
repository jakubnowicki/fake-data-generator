Random string that follows given pattern

Parameters:

* `type: string` - column type
* `unique` (optional, default: FALSE) - boolean, should values be unique
* `length` (optional, default: NULL) - integer, string length. If NULL, string length will be random (see next parameters).
* `min_length` (optional, default: 1) - integer, minimum length if length is random.
* `max_length` (optional, default: 15) - integer, maximum length if length is random.
* `pattern` (optional, default: "[A-Za-z0-9]") - string pattern, for details check [this](https://rdrr.io/cran/stringi/man/stringi-search-charclass.html).

Example:

```yaml
data_frame:
  columns:
    string_column:
      type: string
      length: 3
      pattern: "[ACGT]"
```
