#' co_avg UI Function
#'
#' @description A shiny Module to handle plotting CO 8-hour average concentrations.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_co_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_co"))
  )
}
    
#' co_avg Server Functions
#'
#' @noRd 
mod_co_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    co_data <- reactive({
      co_8hr_avg |> 
        dplyr::filter(
          site_name %in% filterProxy$site() & 
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_co <- plotly::renderPlotly({
      plot_co(co_data(), filterProxy$year())
    })
  })
}
    
## To be copied in the UI
# mod_co_avg_ui("co_avg_1")
    
## To be copied in the server
# mod_co_avg_server("co_avg_1")
