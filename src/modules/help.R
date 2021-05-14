import("shiny")
import("markdown")

export("ui")
export("server")

ui <- function(id, help_values) {
  ns <- NS(id)

  div(
    shiny.fluent::Dropdown.shinyInput(
      ns("select_help"),
      value = help_values[[1]]$key,
      options = unname(help_values)
    ),
    uiOutput(ns("description"))
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      output$description <- renderUI({
        htmltools::HTML(
          includeMarkdown(
            glue::glue("constants/descriptions/{input$select_help}.md")
          )
        )
      })
    }
  })
}
