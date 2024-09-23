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
    shiny::downloadButton(ns("downloadData"), "Download Dataset")
  )
}
    
#' download Server Functions
#'
#' @noRd 
mod_download_server <- function(id, pollutant, region, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset_dl <- reactive({
      dataset <- switch(
        pollutant,
        "PM2.5" = pm25_import_named,
        "PM10" = pm10_import_named,
        "CO" = co_8hr_avg,
        "SO2" = so2_1hr_max,
        "O3" = ncore_o3_8hr_avg,
        "NO2" = ncore_no2_1hr_max
      ) |>  
        dplyr::filter(
          site_name %in% filterProxy$site() &
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$downloadData <- downloadHandler(
      filename = function() {
        paste0(region, "_", pollutant, "_", filterProxy$year(), ".csv")
      },
      content = function(file) {
        write.csv(dataset_dl(), file)
      }
    )
  })
}
    
## To be copied in the UI
# mod_download_ui("download_1")
    
## To be copied in the server
# mod_download_server("download_1")
