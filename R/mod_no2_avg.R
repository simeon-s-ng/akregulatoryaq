#' no2_avg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_no2_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_no2"))
  )
}
    
#' no2_avg Server Functions
#'
#' @noRd 
mod_no2_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    no2_data <- reactive({
      ncore_no2_1hr_max |> 
        dplyr::filter(
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_no2 <- plotly::renderPlotly({
      plot_no2(no2_data(), filterProxy$year())
    })
  })
}
    
## To be copied in the UI
# mod_no2_avg_ui("no2_avg_1")
    
## To be copied in the server
# mod_no2_avg_server("no2_avg_1")
