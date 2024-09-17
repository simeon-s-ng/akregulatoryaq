#' o3_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_o3_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_o3_dv"))
  )
}
    
#' o3_dv Server Functions
#'
#' @noRd 
mod_o3_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Fairbanks" = o3_dvs_fbx,
      "Anchorage" = o3_dvs_anc,
      "Mat-Su" = o3_dvs_ms
    )
    output$plot_o3_dv <- plotly::renderPlotly(
      plot_o3_dv(dataset, region = region)
    )
  })
}
    
## To be copied in the UI
# mod_o3_dv_ui("o3_dv_1")
    
## To be copied in the server
# mod_o3_dv_server("o3_dv_1")
