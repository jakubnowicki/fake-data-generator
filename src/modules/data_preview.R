import("reactable")
import("shiny")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  reactableOutput(ns("preview_data"))
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      output$preview_data <- renderReactable({
        reactable(session$userData$fake_data$get_all_data()[[1]])
      })
    }
  })
}
