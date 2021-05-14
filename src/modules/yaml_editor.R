import("shiny")

export("ui")
export("server")

utils <- use("utils/utils.R")

ui <- function(id, autocompleter) {
  ns <- NS(id)

  shinyAce::aceEditor(
    outputId = ns("editor"),
    mode = "yaml",
    placeholder = "Put your configuration here",
    debounce = 500,
    tabSize = 2,
    autoComplete = "live",
    autoCompleters = "static",
    autoCompleteList = autocompleter,
    height = "100%",
    fontSize = 14
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
            change <- FALSE
            new_fake_data_configuration <- yaml::yaml.load(input$editor)
            if (!identical(session$userData$fake_data_store$get_fake_data_configuration(), new_fake_data_configuration)) {
              change <- TRUE
              session$userData$fake_data_store$set_fake_data_configuration(new_fake_data_configuration)
            }
          }, error = function(e) invisible())
          check <- session$userData$fake_data_store$check_configuration()
          if (change && check) {
            session$userData$triggers$refresh <- session$userData$triggers$refresh + 1
          }
        },
        ignoreInit = TRUE
      )
    }
  })
}
