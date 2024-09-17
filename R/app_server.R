#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # PM2.5 ----
  proxy_pm25_fbx <- mod_filter_data_server("filter_data_fbx_pm25")
  proxy_pm25_anc <- mod_filter_data_server("filter_data_anc_pm25")
  proxy_pm25_jnu <- mod_filter_data_server("filter_data_jnu_pm25")
  proxy_pm25_ms <- mod_filter_data_server("filter_data_ms_pm25")
  proxy_pm25_sw <- mod_filter_data_server("filter_data_sw_pm25")

  mod_pm25_avg_server("pm25_avg_fbx", proxy_pm25_fbx)
  mod_pm25_avg_server("pm25_avg_anc", proxy_pm25_anc)
  mod_pm25_avg_server("pm25_avg_jnu", proxy_pm25_jnu)
  mod_pm25_avg_server("pm25_avg_ms", proxy_pm25_ms)
  mod_pm25_avg_server("pm25_avg_sw", proxy_pm25_sw)

  mod_pm25_epa_dv_server("pm25_epa_dv_fbx", "Fairbanks")
  mod_pm25_epa_dv_server("pm25_epa_dv_anc", "Anchorage")
  mod_pm25_epa_dv_server("pm25_epa_dv_jnu", "Juneau")
  mod_pm25_epa_dv_server("pm25_epa_dv_ms", "Mat-Su")
  mod_pm25_epa_dv_server("pm25_epa_dv_sw", "Bethel")

  mod_pm25_dec_dv_server("pm25_dec_dv_fbx", "Fairbanks")
  mod_pm25_dec_dv_server("pm25_dec_dv_anc", "Anchorage")
  mod_pm25_dec_dv_server("pm25_dec_dv_jnu", "Juneau")
  mod_pm25_dec_dv_server("pm25_dec_dv_ms", "Mat-Su")
  mod_pm25_dec_dv_server("pm25_dec_dv_sw", "Bethel")

  # PM10 ----
  proxy_pm10_fbx <- mod_filter_data_server("filter_data_fbx_pm10")

  mod_pm10_avg_server("pm10_avg_fbx", proxy_pm10_fbx)

  mod_pm10_dv_server("pm10_dv_fbx", "Fairbanks")

  # Data Download
  mod_download_server("download")
}
