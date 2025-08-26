#' filter_data UI Function
#'
#' @description A shiny Module to handle user selected input
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
    div(
      class = 'myPickerInput',
      shinyWidgets::pickerInput(
        ns("year"),
        "Year:",
        range,
        selected = TRUE,
        multiple = FALSE,
        inline = TRUE,
        width = 'fit'
      )
    ),
    div(
      class = 'myPickerInput',
      shinyWidgets::pickerInput(
        ns("site"),
        "Site:",
        sites,
        selected = sites,
        multiple = TRUE,
        inline = TRUE,
        width = 'fit',
        options = list(
          `actions-box` = TRUE,
          `none-selected-text` = "Select a Site"
        )
      )
    )
  )
}

#' filter_data Server Functions
#'
#' @return A list of year & site selected by the user
#'
#' @noRd
mod_filter_data_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
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
