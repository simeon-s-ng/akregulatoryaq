#' pm10_avg UI Function
#'
#' @description A shiny Module to handle plotting PM10 average concentrations.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pm10_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_pm10"))
  )
}
    
#' pm10_avg Server Functions
#'
#' @noRd 
mod_pm10_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    pm10_data <- reactive({
      pm10_import_named |> 
        dplyr::filter(
          site_name %in% filterProxy$site() &
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_pm10 <- plotly::renderPlotly({
      plot_pm10(pm10_data(), filterProxy$year())
    })
  })
}
    
## To be copied in the UI
# mod_pm10_avg_ui("pm10_avg_1")
    
## To be copied in the server
# mod_pm10_avg_server("pm10_avg_1")
