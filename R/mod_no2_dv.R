#' no2_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_no2_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_no2_dv"))
  )
}
    
#' no2_dv Server Functions
#'
#' @noRd 
mod_no2_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Interior" = no2_dvs
    )
    output$plot_no2_dv <- plotly::renderPlotly({
      plot_no2_dv(dataset, region = region)
    })
  })
}
    
## To be copied in the UI
# mod_no2_dv_ui("no2_dv_1")
    
## To be copied in the server
# mod_no2_dv_server("no2_dv_1")
