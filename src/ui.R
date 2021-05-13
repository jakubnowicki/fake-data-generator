fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/sass.min.css")
  ),
  tabsetPanel(
    id = "tabs",
    tabPanel(
      "Hello there!",
      value = "home",
    ),
    tabPanel(
      "Configuration",
      value = "configuration",
      data_configuration$ui("data_configuration")
    ),
    tabPanel(
      "Preview",
      value = "preview",
      data_preview$ui("data_preview")
    ),
    tabPanel(
      "Editor",
      value = "editor",
      yaml_editor$ui("yaml_editor")
    )
  ),
  div(
    class = "download-panel-button",
    DefaultButton.shinyInput("show_download_panel", text = "Download"),
  ),
  reactOutput("download_panel")
)
