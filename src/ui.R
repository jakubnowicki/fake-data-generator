fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/sass.min.css")
  ),
  div(
    class = "grid-container",
    div(
      class = "preview card",
      data_preview$ui("data_preview")
    ),
    div(
      class = "editor card",
      yaml_editor$ui("yaml_editor", autocompleter)
    ),
    div(
      class = "header",
      h1("Fake Data Generator"),
      div(class = "menu-buttons",
        DefaultButton.shinyInput("show_about_panel", text = "About"),
        DefaultButton.shinyInput("show_help_panel", text = "Help"),
        DefaultButton.shinyInput("show_download_panel", text = "Download")
      )
    )
  ),
  downloadLink("download_yaml", "Download yaml"),
  reactOutput("download_panel"),
  reactOutput("about_panel"),
  reactOutput("help_panel")
)
