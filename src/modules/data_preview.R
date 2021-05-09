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
      refresh_data <- reactiveVal(FALSE)

      observeEvent(input$refresh_data, {
        refresh_data(TRUE)
        trigger_value <- trigger() + 1
        trigger(trigger_value)
      }, ignoreInit = TRUE)

      observeEvent(session$userData$global_triggers$selected_tab, {
        if (session$userData$global_triggers$selected_tab == "preview") {
          trigger_value <- trigger() + 1
          trigger(trigger_value)
        }
      }, ignoreInit = TRUE)

      output$preview_data <- renderReactable({
        force(trigger())
        table <- reactable(session$userData$fake_data_store$get_fake_data(refresh_data()))
        refresh_data(FALSE)

        table
      })
    }
  })
}
