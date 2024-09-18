#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # PM2.5 Average and Design Values ----
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

  # PM10 Average and Design Values ----
  proxy_pm10_fbx <- mod_filter_data_server("filter_data_fbx_pm10")
  proxy_pm10_anc <- mod_filter_data_server("filter_data_anc_pm10")
  proxy_pm10_jnu <- mod_filter_data_server("filter_data_jnu_pm10")
  proxy_pm10_ms <- mod_filter_data_server("filter_data_ms_pm10")
  proxy_pm10_sw <- mod_filter_data_server("filter_data_sw_pm10")

  mod_pm10_avg_server("pm10_avg_fbx", proxy_pm10_fbx)
  mod_pm10_avg_server("pm10_avg_anc", proxy_pm10_anc)
  mod_pm10_avg_server("pm10_avg_jnu", proxy_pm10_jnu)
  mod_pm10_avg_server("pm10_avg_ms", proxy_pm10_ms)
  mod_pm10_avg_server("pm10_avg_sw", proxy_pm10_sw)

  mod_pm10_dv_server("pm10_dv_fbx", "Fairbanks")
  mod_pm10_dv_server("pm10_dv_anc", "Anchorage")
  mod_pm10_dv_server("pm10_dv_jnu", "Juneau")
  mod_pm10_dv_server("pm10_dv_ms", "Mat-Su")
  mod_pm10_dv_server("pm10_dv_sw", "Bethel")

  # CO 8-hour Average and Design Values ----
  proxy_co_fbx <- mod_filter_data_server("filter_data_fbx_co")
  proxy_co_anc <- mod_filter_data_server("filter_data_anc_co")

  mod_co_avg_server("co_avg_fbx", proxy_co_fbx)
  mod_co_avg_server("co_avg_anc", proxy_co_anc)

  mod_co_dv_server("co_dv_fbx", "Interior")
  mod_co_dv_server("co_dv_anc", "South Central")

  # SO2 1 hour Maximum and Design Values ----
  proxy_so2_fbx <- mod_filter_data_server("filter_data_fbx_so2")

  mod_so2_avg_server("so2_avg_fbx", proxy_so2_fbx)

  mod_so2_dv_server("so2_dv_fbx", "Interior")

  # O3 8-hour Maximum and Design Values ----
  proxy_o3_fbx <- mod_filter_data_server("filter_data_fbx_o3")

  mod_o3_avg_server("o3_avg_fbx", proxy_o3_fbx)

  mod_o3_dv_server("o3_dv_fbx", "Fairbanks")
  # mod_o3_dv_server("o3_dv_anc", "Anchorage")
  # mod_o3_dv_server("o3_dv_ms", "Mat-Su")

  # NO2 1-hour Masimum and Design Values ----
  proxy_no2_fbx <- mod_filter_data_server("filter_data_fbx_no2")

  mod_no2_avg_server("no2_avg_fbx", proxy_no2_fbx)

  mod_no2_dv_server("no2_dv_fbx", "Interior")

  # Data Download ----
  mod_download_server("download")
}
