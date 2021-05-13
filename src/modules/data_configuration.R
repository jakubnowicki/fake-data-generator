import("shiny")
import("sortable")

export("ui")
export("server")


ui <- function(id) {
  ns <- NS(id)

  tagList(
    div(
      uiOutput(ns("data_configuration_table"))
    ),
    actionButton(
      inputId = ns("add_column"),
      label = "+"
    ),
    sortable_js(
      ns("data_configuration_table"),
      options = sortable_options(
        onSort = sortable_js_capture_input(input_id = ns("data_configuration_table_input"))
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      ns <- session$ns
      trigger <- reactiveVal(0)

      observeEvent(input$data_configuration_table_input, {
        print(input$test_sort_input)
        print(session$userData$fake_data_store$get_fake_data_configuration())
      })

      observeEvent(session$userData$global_triggers$selected_tab,
        {
          if (session$userData$global_triggers$selected_tab == "configuration") {
            trigger_value <- trigger() + 1
            trigger(trigger_value)
          }
        },
        ignoreInit = TRUE
      )

      output$data_configuration_table <- renderUI({
        trigger()
        tagList(
          purrr::imap(
            session$userData$fake_data_store$get_fake_data_configuration()[[1]]$columns,
            ~ div(id = ns(.y), .y, "data-rank-id" = .y, actionButton(ns(paste0("remove_", .y)), "-"))
          )
        )
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

      observeEvent(trigger(), {
        session$userData$observers <- purrr::imap(
          session$userData$fake_data_store$get_fake_data_configuration()[[1]]$columns,
          ~ observeEvent(input[[paste0("remove_", .y)]],
            {
              removeUI(paste0("#", ns(.y)))
              session$userData$observers[[.y]] <- NULL
            },
            ignoreInit = TRUE
          )
        )
      })
    }
  })
}
