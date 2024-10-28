#' naaqs_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_naaqs_table_ui <- function(id) {
  ns <- NS(id)
  tagList(
    gt::gt_output(ns("naaqs_table")),
    shiny::markdown(
      "<a href='https://www.epa.gov/criteria-air-pollutants/naaqs-table' target='_blank'>NAAQS Table for other Criteria Pollutants</a>"
    )
  )
}

#' naaqs_table Server Functions
#'
#' @noRd
mod_naaqs_table_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$naaqs_table <- gt::render_gt(naaqs_table())
  })
}

## To be copied in the UI
# mod_naaqs_table_ui("naaqs_table_1")

## To be copied in the server
# mod_naaqs_table_server("naaqs_table_1")
