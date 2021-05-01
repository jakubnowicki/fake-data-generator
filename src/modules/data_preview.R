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
      trigger <- reactiveVal(0)

      observeEvent(input$refresh_data, {
        session$userData$fake_data$get_all_data(refresh = TRUE)

        trigger_value <- trigger() + 1
        trigger(trigger_value)
      })

      output$preview_data <- renderReactable({
        force(trigger())
        reactable(session$userData$fake_data$get_all_data()[[1]])
      })
    }
  })
}
