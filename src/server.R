fake_data_store <- use("logic/fake_data_store.R")

server <- function(input, output, session) {
  session$userData$fake_data_store <- fake_data_store$FakeDataStore$new(init_fake_data_configuration)
  session$userData$triggers <- reactiveValues(
    refresh = 0
  )


  is_download_panel_open <- reactiveVal(FALSE)
  output$download_panel <- renderReact({
    Panel(
      headerText = "Download",
      isOpen = is_download_panel_open(),
      download$ui("download"),
      onDismiss = JS("function() { Shiny.setInputValue('hide_download_panel', Math.random()); }")
    )
  })

  observeEvent(input$show_download_panel, is_download_panel_open(TRUE))
  observeEvent(input$hide_download_panel, is_download_panel_open(FALSE))

  is_about_panel_open <- reactiveVal(TRUE)
  output$about_panel <- renderReact({
    Panel(
      headerText = "About",
      isOpen = is_about_panel_open(),
      about$ui("about"),
      onDismiss = JS("function() { Shiny.setInputValue('hide_about_panel', Math.random()); }")
    )
  })

  observeEvent(input$show_about_panel, is_about_panel_open(TRUE))
  observeEvent(input$hide_about_panel, is_about_panel_open(FALSE))

  is_help_panel_open <- reactiveVal(FALSE)
  output$help_panel <- renderReact({
    Panel(
      headerText = "Help",
      isOpen = is_help_panel_open(),
      help$ui("help"),
      onDismiss = JS("function() { Shiny.setInputValue('hide_help_panel', Math.random()); }")
    )
  })

  observeEvent(input$show_help_panel, is_help_panel_open(TRUE))
  observeEvent(input$hide_help_panel, is_help_panel_open(FALSE))

  data_preview$server("data_preview")
  yaml_editor$server("yaml_editor")
  download$server("download")
  help$server("help")
}
