fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/sass.min.css")
  ),
  div(
    class = "grid-container",
    div(
      "Preview",
      class = "preview panel",
      data_preview$ui("data_preview")
    ),
    div(
      "Editor",
      class = "editor panel",
      yaml_editor$ui("yaml_editor", autocompleter)
    )
  ),
  div(
    class = "download-panel-button",
    DefaultButton.shinyInput("show_about_panel", text = "About"),
    DefaultButton.shinyInput("show_help_panel", text = "Help"),
    DefaultButton.shinyInput("show_download_panel", text = "Download")
  ),
  reactOutput("download_panel"),
  reactOutput("about_panel"),
  reactOutput("help_panel")
)
