lint_config <- yaml::read_yaml("./tests/lintr_config.yaml", eval.expr = TRUE)

linters <- do.call(lintr::with_defaults, lint_config$linter_configuration)

lints <- list()

for (directory_to_lint in lint_config$directories_to_lint) {
  lints <- c(lints, lintr::lint_dir(paste0("./", directory_to_lint), linters = linters))
}

for (file_to_lint in lint_config$files_to_lint) {
  lints <- c(lints, lintr::lint(filename = file_to_lint, linters = linters))
}

n_errors <- length(lints)

create_linter_output <- function(lints) {
  unlist(
    purrr::map(
      lints,
      ~ append(purrr::imap(.x, ~ paste0(.y, ": ", .x)), values = "=========\n")
    )
  )
}

if (n_errors > 0) {
  write(create_linter_output(lints), stderr())
  stop(sprintf("Lint found %d errors.", n_errors))
}
