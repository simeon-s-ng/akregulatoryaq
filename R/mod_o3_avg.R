#' o3_avg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_o3_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_o3"))
  )
}
    
#' o3_avg Server Functions
#'
#' @noRd 
mod_o3_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    o3_data <- reactive({
      ncore_o3_8hr_avg |> 
        dplyr::filter(
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_o3 <- plotly::renderPlotly({
      plot_o3(o3_data(), filterProxy$year())
    })
  })
}
    
## To be copied in the UI
# mod_o3_avg_ui("o3_avg_1")
    
## To be copied in the server
# mod_o3_avg_server("o3_avg_1")
