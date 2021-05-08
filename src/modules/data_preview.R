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
        session$userData$global_triggers$refresh_data <- TRUE
        trigger_value <- trigger() + 1
        trigger(trigger_value)
      }, ignoreInit = TRUE)

      observeEvent(session$userData$global_triggers$selected_tab, {
        if (session$userData$global_triggers$selected_tab == "preview" && session$userData$global_triggers$refresh_data) {
          trigger_value <- trigger() + 1
          trigger(trigger_value)
        }
      }, ignoreInit = TRUE)

      output$preview_data <- renderReactable({
        force(trigger())
        table <- reactable(session$userData$fake_data_store$get_fake_data(session$userData$global_triggers$refresh_data))
        session$userData$global_triggers$refresh_data <- FALSE

        table
      })
    }
  })
}
