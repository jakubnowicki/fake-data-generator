import("reactable")
import("shiny")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  div(
    shiny.fluent::DefaultButton.shinyInput(ns("refresh_data"), text = "Refresh data"),
    shiny.fluent::Separator("Fake data", alignContent = "center"),
    reactableOutput(ns("preview_data"))
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {

      output$preview_data <- renderReactable({
        input$refresh_data
        reactable(session$userData$fake_data_store$get_fake_data())
      })
    }
  })
}
