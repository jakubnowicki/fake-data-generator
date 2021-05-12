import("shiny")

export("ui")
export("server")

ui <- function(id, row_id) {
  ns <- NS(id)

  div(
    id = ns(row_id),
    "data-rank-id" = row_id,
    span(glue::glue("column name")),
    span("column type"),
    actionButton(ns("modify"), "Modify"),
    actionButton(ns("remove"), "X")
  )
}

server <- function(id, row_id) {
  moduleServer(id, {
    function(input, output, session) {
      ns <- session$ns

      observeEvent(input$remove, {
        removeUI(paste0("#", ns(row_id)))
        session$userData$server_part <- NULL
      })
    }
  })
}
