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
    shinycssloaders::withSpinner(
      gt::gt_output(ns("naaqs_table")),
      type = 1
    ),
    shiny::markdown(
      "<a href='https://www.epa.gov/criteria-air-pollutants/naaqs-table' target='_blank'><abbr title='National Ambient Air Quality Standards'>NAAQS</abbr> Table for other Criteria Pollutants</a>"
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
