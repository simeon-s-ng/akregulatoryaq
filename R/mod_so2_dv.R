#' so2_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_so2_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_so2_dv"))
  )
}
    
#' so2_dv Server Functions
#'
#' @noRd 
mod_so2_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Interior" = so2_dvs
    )
    output$plot_so2_dv <- plotly::renderPlotly(
      plot_so2_dv(dataset, region = region)
    )
  })
}
    
## To be copied in the UI
# mod_so2_dv_ui("so2_dv_1")
    
## To be copied in the server
# mod_so2_dv_server("so2_dv_1")
