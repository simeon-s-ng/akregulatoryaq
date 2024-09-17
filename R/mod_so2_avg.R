#' so2_avg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_so2_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_so2"))
  )
}
    
#' so2_avg Server Functions
#'
#' @noRd 
mod_so2_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    so2_data <- reactive({
      so2_1hr_max |> 
        dplyr::filter(
          site_name %in% filterProxy$site() &
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_so2 <- plotly::renderPlotly(
      plot_so2(so2_data(), filterProxy$year())
    )
  })
}
    
## To be copied in the UI
# mod_so2_avg_ui("so2_avg_1")
    
## To be copied in the server
# mod_so2_avg_server("so2_avg_1")
