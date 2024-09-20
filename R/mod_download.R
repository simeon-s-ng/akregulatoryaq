#' download UI Function
#'
#' @description A shiny Module to handle dataset downloads
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_download_ui <- function(id) {
  ns <- NS(id)
  tagList(
    bslib::accordion_panel(
      "Download Dataset", icon = bsicons::bs_icon("download"),
      bslib::card(
        full_screen = TRUE,
        shinyWidgets::pickerInput(
          ns("dataset"), 
          choices = datasets_dl(),
          selected = FALSE,
          multiple = FALSE,
          options = list(
            `none-selected-text` = "Select a Dataset"
          )
        ),
        shiny::downloadButton(ns("downloadData"), "Download")
      )
    )
  )
}
    
#' download Server Functions
#'
#' @noRd 
mod_download_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    datasetInput <- reactive({
      switch(
        input$dataset,
        "PM2.5" = pm25_import_named,
        "PM10" = pm10_import_named,
        "CO" = co_8hr_avg,
        "SO2" = so2_1hr_max,
        "O3" = ncore_o3_8hr_avg,
        "NO2" = ncore_no2_1hr_max
      )
    })
    output$downloadData <- downloadHandler(
      filename = function() {
        paste0("DEC_AK_", input$dataset, ".csv")
      },
      content = function(file) {
        write.csv(datasetInput(), file)
      }
    )
  })
}
    
## To be copied in the UI
# mod_download_ui("download_1")
    
## To be copied in the server
# mod_download_server("download_1")
