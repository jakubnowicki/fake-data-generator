import("shiny")

export("ui")
export("server")

create_inputs <- function(type, configuration, ns) {
  type_configuration <- configuration[[type]]

  span(
    purrr::imap(
      type_configuration[[-1]],
      ~ create_input(
        name = .y,
        type = .x$input,
        ns = ns,
        value = .x$default
      )
    )
  )
}

create_input <- function(name, type, ns, value) {
  do.call(
    type,
    list(
      inputId = ns(name),
      label = name,
      value = value
    )
  )
}

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
