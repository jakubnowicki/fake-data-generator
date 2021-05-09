import("shiny")
import("sortable")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  tagList(
    div(
      id = ns("test_sort"),
      div("a", "data-rank-id" = "x", p("asdfadsf")),
      div("b", div("asdfa")),
      div("c")
    ),
    actionButton(
      inputId = ns("add_column"),
      label = "+"
    ),
    sortable_js(
      ns("test_sort"),
      options = sortable_options(
        onSort = sortable_js_capture_input(input_id = ns("test_sort_input"))
      )
    )
  )

}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      ns <- session$ns

      observeEvent(input$test_sort_input, {
        print(input$test_sort_input)
      })

      observeEvent(input$add_column, {
        insertUI(
          paste0("#", ns("test_sort")),
          where = "beforeEnd",
          ui = div(
            id = ns("test_add"), "test", "data-rank-id" = "y", actionButton(ns("remove_test"), "-")
          ),
          session = session
        )
      })

      observeEvent(input$remove_test, {
        removeUI(paste0("#", ns("test_add")))
      })
    }
  })
}
