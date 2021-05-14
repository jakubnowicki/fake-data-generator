import("shiny")
import("markdown")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)
  div(
    uiOutput(ns("description"))
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      output$description <- renderUI({
        htmltools::HTML(includeMarkdown("constants/descriptions/numeric.md"))
      })
    }
  })
}
