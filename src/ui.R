fluentPage(
    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/sass.min.css")
  ),
  div(
    Pivot(
      PivotItem(
        headerText = "Hello there!",
        "Home screen placeholder"
      ),
      PivotItem(
        headerText = "Configuration",
        "Fake data configuration placeholder"
      ),
      PivotItem(
        headerText = "Preview",
        "Data preview"
      ),
      PivotItem(
        headerText = "Editor",
        "Yaml editor"
      )
    )
  ),
  div(
    class = "download-panel-button",
    DefaultButton.shinyInput("show_download_panel", text = "Download"),
  ),
  reactOutput("download_panel")
)
