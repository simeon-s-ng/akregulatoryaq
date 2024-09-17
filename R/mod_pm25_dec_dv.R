#' pm25_dec_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pm25_dec_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_pm25_dec_dv"))
  )
}
    
#' pm25_dec_dv Server Functions
#' 
#' @param region Region to plot - must be string
#'
#' @noRd 
mod_pm25_dec_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Fairbanks" = pm25_dvs_fbx,
      "Anchorage" = pm25_dvs_anc,
      "Juneau" = pm25_dvs_jnu,
      "Mat-Su" = pm25_dvs_ms,
      "Bethel" = pm25_dvs_sw
    )
    output$plot_pm25_dec_dv <- plotly::renderPlotly({
      plot_pm25_dec_dv(dataset, region = region)
    })
  })
}
    
## To be copied in the UI
# mod_pm25_dec_dv_ui("pm25_dec_dv_1")
    
## To be copied in the server
# mod_pm25_dec_dv_server("pm25_dec_dv_1")
