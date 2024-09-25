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
        ) |> 
        dplyr::arrange(Date) |>
        dplyr::mutate(
          site_name = dplyr::case_when(
            pollutant == "PM2.5" ~ paste(site_name, "PM2.5 (\u00B5g/m\u00B3)"),
            pollutant == "PM10" ~ paste(site_name, "PM10 (\u00B5g/m\u00B3)"),
            pollutant == "CO" ~ paste(site_name, "CO (ppm)"),
            pollutant == "SO2" ~ paste(site_name, "SO2 (ppb)"),
            pollutant == "O3" ~ paste(site_name, "O3 (ppm)"),
            pollutant == "NO2" ~ paste(site_name, "NO2 (ppb)"),
            TRUE ~ 'site_name'
          )
        ) |> 
        tidyr::pivot_wider(
          names_from = site_name, 
          values_from = sample_measurement
        )
    })
    output$downloadData <- downloadHandler(
      filename = function() {
        paste0(region, "_", pollutant, "_", filterProxy$year(), ".csv")
      },
      content = function(file) {
        readr::write_excel_csv(dataset_dl(), file)
      }
    )
  })
}
    
## To be copied in the UI
# mod_download_ui("download_1")
    
## To be copied in the server
# mod_download_server("download_1")
