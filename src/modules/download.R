import("shiny")
import("utils")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  tagList(
    uiOutput(ns("yaml_download_button")),
    uiOutput(ns("csv_download_button")),
    uiOutput(ns("rds_download_button"))
  )
}

server <- function(id) {
  moduleServer(id, {
    function(input, output, session) {
      ns <- session$ns

      output$yaml_download_button <- renderUI({
        link <- session$registerDownload("yaml", "configuration.yaml", NA, function(filename) {
          yaml::write_yaml(session$userData$fake_data_store$get_fake_data_configuration(), filename)
        })
        shiny.fluent::DefaultButton.shinyInput(ns("download_yaml"), text = "Download yaml", href = link)
      })

      output$csv_download_button <- renderUI({
        link <- session$registerDownload("csv", "fake_data.csv", NA, function(filename) {
          write.csv(session$userData$fake_data_store$get_fake_data(refresh = FALSE), filename)
        })
        shiny.fluent::DefaultButton.shinyInput(ns("download_csv"), text = "Download csv", href = link)
      })

      output$rds_download_button <- renderUI({
        link <- session$registerDownload("rds", "fake_data_generator.RDS", NA, function(filename) {
          saveRDS(session$userData$fake_data_store$get_fake_data_generator(), filename)
        })
        shiny.fluent::DefaultButton.shinyInput(ns("download_rds"), text = "Download RDS", href = link)
      })
    }
  })
}
