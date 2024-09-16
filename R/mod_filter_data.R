#' filter_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param range Year range of when pollutant was measured in the region.
#' @param sites List of sites in the region.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_filter_data_ui <- function(id, range, sites) {
  ns <- NS(id)
  tagList(
    shinyWidgets::pickerInput(
      ns("year"),
      "Year:",
      range,
      selected = TRUE,
      multiple = FALSE
    ),
    shinyWidgets::pickerInput(
      ns("site"),
      "Site:",
      sites,
      selected = sites,
      multiple = TRUE,
      options = list(
        `actions-box` = TRUE,
        `none-selected-text` = "Select a Site"
      )
    )
  )
}
    
#' filter_data Server Functions
#'
#' @noRd 
mod_filter_data_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    # filters <- reactiveValues(year = input$year, site = input$site)
    return(
      list(
        year = reactive({input$year}),
        site = reactive({input$site})
      )
    )
  })
}
    
## To be copied in the UI
# mod_filter_data_ui("filter_data_1")
    
## To be copied in the server
# mod_filter_data_server("filter_data_1")
