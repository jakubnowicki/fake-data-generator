fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/sass.min.css")
  ),
  tabsetPanel(
    tabPanel(
      "Hello there!"
    ),
    tabPanel(
      "Configuration",
      div(id = "test_sort", div("a"), div("b"), div("c"))
    ),
    tabPanel(
      "Preview",
      data_preview$ui("data_preview")
    ),
    tabPanel(
      "Editor",
      shinyAce::aceEditor(
        outputId = "editor",
        mode = "yaml",
        placeholder = "Show a placeholder when the editor is empty ...",
        value = "aaasdfsadfa"
      )
    )
  ),
  div(
    class = "download-panel-button",
    DefaultButton.shinyInput("show_download_panel", text = "Download"),
  ),
  reactOutput("download_panel"),
  sortable::sortable_js("test_sort")
)
