#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  filterProxy <- mod_filter_data_server("filter_data_fbx_pm25")
  mod_pm25_avg_server("pm25_avg_fbx", filterProxy)
}
