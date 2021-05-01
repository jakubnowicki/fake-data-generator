server <- function(input, output, session) {
  is_download_panel_open <- reactiveVal(FALSE)
  output$download_panel <- renderReact({
    Panel(
      headerText = "Download data",
      isOpen = is_download_panel_open(),
       "Download buttons and stuff",
      onDismiss = JS("function() { Shiny.setInputValue('hide_download_panel', Math.random()); }")
    )
  })
  observeEvent(input$show_download_panel, is_download_panel_open(TRUE))
  observeEvent(input$hide_download_panel, is_download_panel_open(FALSE))
}
