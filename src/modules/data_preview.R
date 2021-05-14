import("reactable")
import("shiny")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  div(
    reactableOutput(ns("preview_data"))
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {

      output$preview_data <- renderReactable({
        session$userData$triggers$refresh
        reactable(session$userData$fake_data_store$get_fake_data())
      })
    }
  })
}
