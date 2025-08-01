#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # PM2.5 Average and Design Values ----
  proxy_pm25_fbx <- mod_filter_data_server("filter_data_fbx_pm25")
  mod_pm25_avg_server("pm25_avg_fbx", proxy_pm25_fbx)
  mod_pm25_epa_dv_server("pm25_epa_dv_fbx", "Fairbanks")
  mod_pm25_dec_dv_server("pm25_dec_dv_fbx", "Fairbanks")
  mod_download_server("dl_pm25_fbx", "PM2.5", "Fairbanks", proxy_pm25_fbx)

  proxy_pm25_anc <- mod_filter_data_server("filter_data_anc_pm25")
  mod_pm25_avg_server("pm25_avg_anc", proxy_pm25_anc)
  mod_pm25_epa_dv_server("pm25_epa_dv_anc", "Anchorage")
  mod_pm25_dec_dv_server("pm25_dec_dv_anc", "Anchorage")
  mod_download_server("dl_pm25_anc", "PM2.5", "Anchorage", proxy_pm25_anc)

  proxy_pm25_jnu <- mod_filter_data_server("filter_data_jnu_pm25")
  mod_pm25_avg_server("pm25_avg_jnu", proxy_pm25_jnu)
  mod_pm25_epa_dv_server("pm25_epa_dv_jnu", "Juneau")
  mod_pm25_dec_dv_server("pm25_dec_dv_jnu", "Juneau")
  mod_download_server("dl_pm25_jnu", "PM2.5", "Juneau", proxy_pm25_jnu)

  proxy_pm25_ms <- mod_filter_data_server("filter_data_ms_pm25")
  mod_pm25_avg_server("pm25_avg_ms", proxy_pm25_ms)
  mod_pm25_epa_dv_server("pm25_epa_dv_ms", "Mat-Su")
  mod_pm25_dec_dv_server("pm25_dec_dv_ms", "Mat-Su")
  mod_download_server("dl_pm25_ms", "PM2.5", "MatSu", proxy_pm25_ms)

  proxy_pm25_sw <- mod_filter_data_server("filter_data_sw_pm25")
  mod_pm25_avg_server("pm25_avg_sw", proxy_pm25_sw)
  mod_pm25_epa_dv_server("pm25_epa_dv_sw", "Bethel")
  mod_pm25_dec_dv_server("pm25_dec_dv_sw", "Bethel")
  mod_download_server("dl_pm25_sw", "PM2.5", "Bethel", proxy_pm25_sw)

  # PM10 Average and Design Values ----
  proxy_pm10_fbx <- mod_filter_data_server("filter_data_fbx_pm10")
  mod_pm10_avg_server("pm10_avg_fbx", proxy_pm10_fbx)
  mod_pm10_dv_server("pm10_dv_fbx", "Fairbanks")
  mod_download_server("dl_pm10_fbx", "PM10", "Fairbanks", proxy_pm10_fbx)

  proxy_pm10_anc <- mod_filter_data_server("filter_data_anc_pm10")
  mod_pm10_avg_server("pm10_avg_anc", proxy_pm10_anc)
  mod_pm10_dv_server("pm10_dv_anc", "Anchorage")
  mod_download_server("dl_pm10_anc", "PM10", "Anchorage", proxy_pm10_anc)

  proxy_pm10_jnu <- mod_filter_data_server("filter_data_jnu_pm10")
  mod_pm10_avg_server("pm10_avg_jnu", proxy_pm10_jnu)
  mod_pm10_dv_server("pm10_dv_jnu", "Juneau")
  mod_download_server("dl_pm10_jnu", "PM10", "Juneau", proxy_pm10_jnu)

  proxy_pm10_ms <- mod_filter_data_server("filter_data_ms_pm10")
  mod_pm10_avg_server("pm10_avg_ms", proxy_pm10_ms)
  mod_pm10_dv_server("pm10_dv_ms", "Mat-Su")
  mod_download_server("dl_pm10_ms", "PM10", "MatSu", proxy_pm10_ms)

  proxy_pm10_sw <- mod_filter_data_server("filter_data_sw_pm10")
  mod_pm10_avg_server("pm10_avg_sw", proxy_pm10_sw)
  mod_pm10_dv_server("pm10_dv_sw", "Bethel")
  mod_download_server("dl_pm10_sw", "PM10", "Bethel", proxy_pm10_sw)

  # CO 8-hour Average and Design Values ----
  proxy_co_fbx <- mod_filter_data_server("filter_data_fbx_co")
  mod_co_avg_server("co_avg_fbx", proxy_co_fbx)
  mod_co_dv_server("co_dv_fbx", "Interior")
  mod_download_server("dl_co_fbx", "CO", "Fairbanks", proxy_co_fbx)

  proxy_co_anc <- mod_filter_data_server("filter_data_anc_co")
  mod_co_avg_server("co_avg_anc", proxy_co_anc)
  mod_co_dv_server("co_dv_anc", "South Central")
  mod_download_server("dl_co_anc", "CO", "Anchorage", proxy_co_anc)

  # SO2 1 hour Maximum and Design Values ----
  proxy_so2_fbx <- mod_filter_data_server("filter_data_fbx_so2")
  mod_so2_avg_server("so2_avg_fbx", proxy_so2_fbx)
  mod_so2_dv_server("so2_dv_fbx", "Interior")
  mod_download_server("dl_so2_fbx", "SO2", "Fairbanks", proxy_so2_fbx)

  # O3 8-hour Maximum and Design Values ----
  proxy_o3_fbx <- mod_filter_data_server("filter_data_fbx_o3")
  mod_o3_avg_server("o3_avg_fbx", proxy_o3_fbx)
  mod_o3_dv_server("o3_dv_fbx", "Fairbanks")
  mod_download_server("dl_o3_fbx", "O3", "Fairbanks", proxy_o3_fbx)

  # mod_o3_dv_server("o3_dv_anc", "Anchorage")
  # mod_o3_dv_server("o3_dv_ms", "Mat-Su")

  # NO2 1-hour Masimum and Design Values ----
  proxy_no2_fbx <- mod_filter_data_server("filter_data_fbx_no2")
  mod_no2_avg_server("no2_avg_fbx", proxy_no2_fbx)
  mod_no2_dv_server("no2_dv_fbx", "Interior")
  mod_download_server("dl_no2_fbx", "NO2", "Fairbanks", proxy_no2_fbx)

  # NAAQS Table ----

  mod_naaqs_table_server("pm25_table_fbx")
  mod_naaqs_table_server("pm10_table_fbx")
  mod_naaqs_table_server("co_table_fbx")
  mod_naaqs_table_server("so2_table_fbx")
  mod_naaqs_table_server("o3_table_fbx")
  mod_naaqs_table_server("no2_table_fbx")

  mod_naaqs_table_server("pm25_table_anc")
  mod_naaqs_table_server("pm10_table_anc")
  mod_naaqs_table_server("co_table_anc")

  mod_naaqs_table_server("pm25_table_jnu")
  mod_naaqs_table_server("pm10_table_jnu")

  mod_naaqs_table_server("pm25_table_ms")
  mod_naaqs_table_server("pm10_table_ms")

  mod_naaqs_table_server("pm25_table_sw")
  mod_naaqs_table_server("pm10_table_sw")

  # # Data Download ----
  # mod_download_server("download")
}
