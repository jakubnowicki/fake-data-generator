import("shiny")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  shinyAce::aceEditor(
    outputId = ns("editor"),
    mode = "yaml",
    placeholder = "Put your configuration here"
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      observeEvent(session$userData$global_triggers$selected_tab, {
        if (session$userData$global_triggers$selected_tab == "editor") {
          shinyAce::updateAceEditor(
            session,
            "editor",
            value = yaml::as.yaml(session$userData$fake_data_configuration)
          )
        }
      })

      observeEvent(input$editor, {
        session$userData$fake_data_configuration <- yaml::yaml.load(input$editor)
        session$userData$fake_data <- fixtuRes::MockDataGenerator$new(session$userData$fake_data_configuration)
      }, ignoreInit = TRUE)

    }
  })
}
