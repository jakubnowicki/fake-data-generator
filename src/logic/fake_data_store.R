import("R6")
import("fixtuRes")

export("FakeDataStore")

FakeDataStore <- R6Class(
  "FakeDataStore",
  private = list(
    fake_data = NULL,
    fake_data_configuration = NULL,
    set_new_fake_data_configuration = function(new_configuration) {
      private$fake_data_configuration <- new_configuration
      private$generate_new_fake_data()
    },
    generate_new_fake_data = function() {
      private$fake_data <- MockDataGenerator$new(private$fake_data_configuration)
    }
  ),
  public = list(
    initialize = function(initial_configuration) {
      private$set_new_fake_data_configuration(initial_configuration)
    },
    get_fake_data = function(refresh = FALSE) {
      private$fake_data$get_all_data(refresh = refresh)[[1]]
    },
    get_fake_data_configuration = function() {
      private$fake_data_configuration
    },
    set_fake_data_configuration = function(new_configuration) {
      private$set_new_fake_data_configuration(new_configuration)
    }
  )
)
