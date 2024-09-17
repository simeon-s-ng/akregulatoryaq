#' pm10_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pm10_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_pm10_dv"))
  )
}
    
#' pm10_dv Server Functions
#'
#' @noRd 
mod_pm10_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Fairbanks" = pm10_dvs_fbx,
      "Anchorage" = pm10_dvs_anc,
      "Juneau" = pm10_dvs_jnu,
      "Mat-Su" = pm10_dvs_ms,
      "Bethel" = pm10_dvs_sw
    )
    output$plot_pm10_dv <- plotly::renderPlotly({
      plot_pm10_dv(dataset, region = region)
    })
  })
}
    
## To be copied in the UI
# mod_pm10_dv_ui("pm10_dv_1")
    
## To be copied in the server
# mod_pm10_dv_server("pm10_dv_1")
