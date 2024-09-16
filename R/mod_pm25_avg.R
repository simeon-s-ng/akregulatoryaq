#' pm25_avg UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pm25_avg_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("plot_pm25"))
  )
}
    
#' pm25_avg Server Functions
#' 
#' @param filter_data
#'
#' @noRd 
mod_pm25_avg_server <- function(id, filterProxy){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    pm25_data <- reactive({
      pm25_import_named |> 
        dplyr::filter(
          site_name %in% filterProxy$site() & 
          lubridate::year(Date) %in% filterProxy$year()
        )
    })
    output$plot_pm25 <- plotly::renderPlotly({
      plot_pm25(pm25_data(), filterProxy$year())
    })
    # pm25_data <- reactive({
    #   pm25_import_named |> 
    #     dplyr::filter(
    #       site_name %in% isolate(filterProxy$site) & 
    #       lubridate::year(Date) %in% isolate(filterProxy$year)
    #     )
    # })
    # print(head(pm25_data))
    # output$pm25 <- plotly::renderPlotly({
      
    #   plot_pm25(pm25_data(), isolate(filterProxy$year), isolate(filterProxy$site))
    # })
  })
}
    
## To be copied in the UI
# mod_pm25_avg_ui("pm25_avg_1")
    
## To be copied in the server
# mod_pm25_avg_server("pm25_avg_1")
