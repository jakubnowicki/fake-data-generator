server <- function(input, output, session) {
  session$userData$global_triggers <- reactiveValues(
    selected_tab = "home",
    refresh_data = FALSE
  )

  session$userData$fake_data_configuration <- init_fake_data_configuration
  session$userData$fake_data <- fixtuRes::MockDataGenerator$new(init_fake_data_configuration)

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

  data_preview$server("data_preview")
  yaml_editor$server("yaml_editor")

  observeEvent(input$tabs, {
    session$userData$global_triggers$selected_tab <- input$tabs
  })
}
