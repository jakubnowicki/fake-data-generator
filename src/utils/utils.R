import("magrittr")

export("strip_configuration")

strip_configuration <- function(configuration) {
  configuration %>%
    unlist() %>%
    paste(collapse = "") %>%
    gsub(pattern = " ", replacement = "")
}
