import("shiny")
import("utils")

export("ui")
export("server")

ui <- function(id) {
  ns <- NS(id)

  tagList(
    shiny.fluent::Separator(),
    uiOutput(ns("yaml_download_button")),
    shiny.fluent::Separator(),
    uiOutput(ns("csv_download_button")),
    shiny.fluent::Separator(),
    uiOutput(ns("rds_download_button")),
    shiny.fluent::Separator()
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
        shiny.fluent::ActionButton.shinyInput(
          ns("download_yaml"),
          text = "Download yaml configuration file",
          iconProps = list("iconName" = "Settings"),
          href = link
        )
      })

      output$csv_download_button <- renderUI({
        link <- session$registerDownload("csv", "fake_data.csv", NA, function(filename) {
          write.csv(session$userData$fake_data_store$get_fake_data(refresh = FALSE), filename)
        })
        shiny.fluent::ActionButton.shinyInput(
          ns("download_csv"),
          text = "Download data as csv file",
          iconProps = list("iconName" = "TableGroup"),
          href = link
        )
      })

      output$rds_download_button <- renderUI({
        link <- session$registerDownload("rds", "fake_data_generator.RDS", NA, function(filename) {
          saveRDS(session$userData$fake_data_store$get_fake_data_generator(), filename)
        })
        shiny.fluent::ActionButton.shinyInput(
          ns("download_rds"),
          text = "Download generator as RDS file",
          iconProps = list("iconName" = "ProcessMetaTask"),
          href = link
        )
      })
    }
  })
}
