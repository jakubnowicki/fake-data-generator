library(testthat)

test_dir(
  "./tests/testthat",
  reporter = MultiReporter$new(
    reporters = c(TapReporter$new(), ProgressReporter$new())
  )
)
