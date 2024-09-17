#' co_dv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_co_dv_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_co_dv"))
  )
}
    
#' co_dv Server Functions
#'
#' @noRd 
mod_co_dv_server <- function(id, region){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dataset <- switch(
      region,
      "Interior" = co_dvs_fbx,
      "South Central" = co_dvs_anc
    )
    output$plot_co_dv <- plotly::renderPlotly({
      plot_co_dv(dataset, region = region)
    })
  })
}
    
## To be copied in the UI
# mod_co_dv_ui("co_dv_1")
    
## To be copied in the server
# mod_co_dv_server("co_dv_1")
