import("shiny")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  shinyAce::aceEditor(
    outputId = ns("editor"),
    mode = "yaml",
    placeholder = "Put your configuration here",
    debounce = 500,
    tabSize = 2
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      observe({
          shinyAce::updateAceEditor(
            session,
            "editor",
            value = yaml::as.yaml(session$userData$fake_data_store$get_fake_data_configuration())
          )
        }
      )

      observeEvent(input$editor,
        {
          # TODO: Add exception - throw an error if yaml is not valid on changing the tab.
          tryCatch({
            new_fake_data_configuration <- yaml::yaml.load(input$editor)
            if (!identical(session$userData$fake_data_configuration, new_fake_data_configuration)) {
              session$userData$fake_data_store$set_fake_data_configuration(new_fake_data_configuration)
            }
          }, error = function(e) invisible())
        },
        ignoreInit = TRUE
      )
    }
  })
}
