#' ui_page_navbar 
#'
#' @description Wrapper for main page navbar.
#'
#' @return A bslib::page_navbar()
#' 
#' @importFrom bsicons bs_icon
#'
#' @noRd
ui_page_navbar <- function() {
  thematic::thematic_shiny(font = "auto")

  bslib::page_navbar(
    id = "nav",
    theme = ui_theme(),
    inverse = TRUE,
    fillable = FALSE,
    # Styling for sidebar button and link
    htmltools::tags$head(
      htmltools::tags$style(
        htmltools::HTML(
          "
            .bslib-sidebar-layout > .collapse-toggle {
              margin-top: 10px;
              background-color: #194A6B;
            }
            .bslib-sidebar-layout > .collapse-toggle > .collapse-icon {
              fill: white !important;
            }
            .bslib-nav-item > a {
              color: rgb(255, 255, 255)
            }
            .nav-link.active > a.active {
              color: #194A6B
            }
            .accordion-button {
              padding: 0.75rem 1rem
            }
          "
        )
      )
    ),
    htmltools::tags$head(
      htmltools::tags$style(
        htmltools::HTML(navbar_js())
      )
    ),
    htmltools::tags$style(
      type="text/css",
      ".shiny-output-error { visibility: hidden; }",
      ".shiny-output-error:before { visibility: hidden; }"
    ),
    ## SIDEBAR -----------------------------------------------------------------
    sidebar = bslib::sidebar(
      open = FALSE,
      padding = c(10, 15),
      gap = 10,
      width = "40%",
      bslib::accordion(
        bslib::accordion_panel(
          "Filters", icon = bsicons::bs_icon("filter"),
          # Fairbanks PM25 Filters ----
          shiny::conditionalPanel(  
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'PM2.5'",
            # PM25 Year Filter Module
            mod_filter_data_ui(
              "filter_data_fbx_pm25", 
              range_pm25(),
              fbx_sites_pm25()
            ),
            fbx_pm25_info(),
            mod_download_ui("dl_pm25_fbx")
          ),
          # Fairbanks PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'PM10'",
            mod_filter_data_ui(
              "filter_data_fbx_pm10",
              range_pm10_fbx(),
              fbx_sites_pm10()
            ),
            fbx_pm10_info(),
            mod_download_ui("dl_pm10_fbx")
          ),
          # Fairbanks CO Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'CO'",
            mod_filter_data_ui(
              "filter_data_fbx_co",
              range_co(),
              fbx_sites_co()
            ),
            fbx_co_info(),
            mod_download_ui("dl_co_fbx")
          ),
          # Fairbanks SO2 Filter ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'SO2'",
            mod_filter_data_ui(
              "filter_data_fbx_so2",
              range_so2(),
              fbx_sites_so2()
            ),
            fbx_so2_info(),
            mod_download_ui("dl_so2_fbx")
          ),
          # Fairbanks O3 Filter ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'O3'",
            mod_filter_data_ui(
              "filter_data_fbx_o3",
              range_o3(),
              "NCore"
            ),
            fbx_o3_info(),
            mod_download_ui("dl_o3_fbx")
          ),
          # Fairbanks NO2 Filter ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'NO2'",
            mod_filter_data_ui(
              "filter_data_fbx_no2",
              range_no2(),
              "NCore"
            ),
            fbx_no2_info(),
            mod_download_ui("dl_no2_fbx")
          ),
          # Anchorage PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Anchorage' & input.anc == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_anc_pm25",
              range_pm25(),
              anc_sites_pm25()
            ),
            anc_pm25_info(),
            mod_download_ui("dl_pm25_anc")
          ),
          # Anchorage PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Anchorage' & input.anc == 'PM10'",
            mod_filter_data_ui(
              "filter_data_anc_pm10",
              range_pm10(),
              anc_sites_pm10()
            ),
            anc_pm10_info(),
            mod_download_ui("dl_pm10_anc")
          ),
          # Anchorage CO Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Anchorage' & input.anc == 'CO'",
            mod_filter_data_ui(
              "filter_data_anc_co",
              range_co(),
              anc_sites_co()
            ),
            anc_co_info(),
            mod_download_ui("dl_co_anc")
          ),
          # Juneau PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Juneau' & input.jnu == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_jnu_pm25",
              range_pm25(),
              jnu_sites_pm25()
            ),
            jnu_pm25_info(),
            mod_download_ui("dl_pm25_jnu")
          ),
          # Juneau PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Juneau' & input.jnu == 'PM10'",
            mod_filter_data_ui(
              "filter_data_jnu_pm10",
              range_pm10(),
              jnu_sites_pm10()
            ),
            jnu_pm10_info(),
            mod_download_ui("dl_pm10_jnu")
          ),
          # Mat-Su PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Mat-Su' & input.ms == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_ms_pm25",
              range_pm25(),
              matsu_sites_pm25()
            ),
            ms_pm25_info(),
            mod_download_ui("dl_pm25_ms")
          ),
          # Mat-Su PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Mat-Su' & input.ms == 'PM10'",
            mod_filter_data_ui(
              "filter_data_ms_pm10",
              range_pm10(),
              matsu_sites_pm10()
            ),
            ms_pm10_info(),
            mod_download_ui("dl_pm10_ms")
          ),
          # Bethel PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Bethel' & input.sw == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_sw_pm25",
              range_pm25_bethel(),
              bethel_sites_pm25()
            ),
            sw_pm25_info(),
            mod_download_ui("dl_pm25_sw")
          ),
          # Bethel PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Bethel' & input.sw == 'PM10'",
            mod_filter_data_ui(
              "filter_data_sw_pm10",
              range_pm25_bethel(),
              bethel_sites_pm25()
            ),
            sw_pm10_info(),
            mod_download_ui("dl_pm10_sw")
          )
        ),
        open = "Filters"
      )
    ),
    # REGION PAGES -------------------------------------------------------------
    # Fairbanks ----
    bslib::nav_panel(
      title = "Fairbanks",
      bslib::navset_card_underline(
        title = "Fairbanks North Star Borough",
        id = "fnsb",
        bslib::nav_panel(
          title = "PM2.5",
          bslib::card(
            bslib::card_header("Fairbanks Particulate Matter 2.5 (PM2.5)"),
            fbx_pm25_desc()
          ),
          plot_card_pm25(
            "pm25_avg_fbx", 
            "pm25_epa_dv_fbx", 
            "pm25_dec_dv_fbx",
            "pm25_table_fbx"
          )
        ),
        bslib::nav_panel(
          title = "PM10",
          bslib::card(
            bslib::card_header("Fairbanks Particulate Matter 10 (PM10)"),
            fbx_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_fbx"), 
            mod_pm10_dv_ui("pm10_dv_fbx"),
            mod_naaqs_table_ui("pm10_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = "CO",
          bslib::card(
            bslib::card_header("Fairbanks Carbon Monoxide (CO)"),
            fbx_co_desc()
          ),
          plot_card(
            mod_co_avg_ui("co_avg_fbx"), 
            mod_co_dv_ui("co_dv_fbx"),
            mod_naaqs_table_ui("co_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = "SO2",
          bslib::card(
            bslib::card_header("Fairbanks Sulfur Dioxide (SO2)"),
            fbx_so2_desc()
          ),
          plot_card(
            mod_so2_avg_ui("so2_avg_fbx"), 
            mod_so2_dv_ui("so2_dv_fbx"),
            mod_naaqs_table_ui("so2_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = "O3",
          bslib::card(
            bslib::card_header("Fairbanks Ozone (O3)"),
            fbx_o3_desc()
          ),
          plot_card(
            mod_o3_avg_ui("o3_avg_fbx"), 
            mod_o3_dv_ui("o3_dv_fbx"),
            mod_naaqs_table_ui("o3_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = "NO2",
          bslib::card(
            bslib::card_header("Fairbanks Nitrogen Dioxide (NO2)"),
            fbx_no2_desc()
          ),
          plot_card(
            mod_no2_avg_ui("no2_avg_fbx"), 
            mod_no2_dv_ui("no2_dv_fbx"),
            mod_naaqs_table_ui("no2_table_fbx")
          )
        )
      ),
      ui_footer()
    ),
    # Anchorage ----
    bslib::nav_panel(
      title = "Anchorage",
      bslib::navset_card_underline(
        title = "Municipality of Anchorage",
        id = "anc",
        bslib::nav_panel(
          title = "PM2.5",
          bslib::card(
            bslib::card_header("Anchorage Particulate Matter 2.5 (PM2.5)"),
            anc_pm25_desc()
          ),
          plot_card_pm25(
            "pm25_avg_anc", 
            "pm25_epa_dv_anc", 
            "pm25_dec_dv_anc",
            "pm25_table_anc"
          )
        ),
        bslib::nav_panel(
          title = "PM10",
          bslib::card(
            bslib::card_header("Anchorage Particulate Matter 10 (PM10)"),
            anc_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_anc"), 
            mod_pm10_dv_ui("pm10_dv_anc"),
            mod_naaqs_table_ui("pm10_table_anc")
          )
        ),
        bslib::nav_panel(
          title = "CO",
          bslib::card(
            bslib::card_header("Anchorage Carbon Monoxide (CO)"),
            anc_co_desc()
          ),
          plot_card(
            mod_co_avg_ui("co_avg_anc"), 
            mod_co_dv_ui("co_dv_anc"),
            mod_naaqs_table_ui("co_table_anc")
          )
        )
      ),
      ui_footer()
    ),
    # Juneau ----
    bslib::nav_panel(
      title = "Juneau",
      bslib::navset_card_underline(
        title = "City and Borough of Juneau",
        id = "jnu",
        bslib::nav_panel(
          title = "PM2.5",
          bslib::card(
            bslib::card_header("Juneau Particulate Matter 2.5 (PM2.5)"),
            jnu_pm25_desc()
          ),
          plot_card_pm25(
            "pm25_avg_jnu", 
            "pm25_epa_dv_jnu", 
            "pm25_dec_dv_jnu",
            "pm25_table_jnu"
          )
        ),
        bslib::nav_panel(
          title = "PM10",
          bslib::card(
            bslib::card_header("Juneau Particulate Matter 10 (PM10)"),
            jnu_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_jnu"), 
            mod_pm10_dv_ui("pm10_dv_jnu"),
            mod_naaqs_table_ui("pm10_table_jnu")
          )
        )
      ),
      ui_footer()
    ),
    # Mat-Su ----
    bslib::nav_panel(
      title = "Mat-Su",
      bslib::navset_card_underline(
        title = "Matanuska-Susitna Borough",
        id = "ms",
        bslib::nav_panel(
          title = "PM2.5",
          bslib::card(
            bslib::card_header("Mat-Su Particulate Matter 2.5 (PM2.5)"),
            ms_pm25_desc()
          ),
          plot_card_pm25(
            "pm25_avg_ms", 
            "pm25_epa_dv_ms", 
            "pm25_dec_dv_ms",
            "pm25_table_ms"
          )
        ),
        bslib::nav_panel(
          title = "PM10",
          bslib::card(
            bslib::card_header("Mat-Su Particulate Matter 10 (PM10)"),
            ms_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_ms"), 
            mod_pm10_dv_ui("pm10_dv_ms"),
            mod_naaqs_table_ui("pm10_table_ms")
          )
        )
      ),
      ui_footer()
    ),
    # Bethel ----
    bslib::nav_panel(
      title = "Bethel",
      bslib::navset_card_underline(
        title = "Southwest Alaska",
        id = "sw",
        bslib::nav_panel(
          title = "PM2.5",
          bslib::card(
            bslib::card_header("Bethel Particulate Matter 2.5 (PM2.5)"),
            sw_pm25_desc()
          ),
          plot_card(
            mod_pm25_avg_ui("pm25_avg_sw"), 
            mod_pm25_dec_dv_ui("pm25_dec_dv_sw"),
            mod_naaqs_table_ui("pm25_table_sw")
          )
         ),
        bslib::nav_panel(
          title = "PM10",
          bslib::card(
            bslib::card_header("Bethel Particulate Matter 10 (PM10)"),
            sw_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_sw"), 
            mod_pm10_dv_ui("pm10_dv_sw"),
            mod_naaqs_table_ui("pm10_table_sw")
          )
        )
      ),
      ui_footer()
    ),
    bslib::nav_spacer(),
    # Link to realtime data ----
    bslib::nav_item(
      htmltools::tags$a(
        shiny::icon("wind"), 
        "Alaska Real Time Air Quality Data", 
        href = "https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/", 
        target = "_blank"
      )
    )
  ) |> 
    htmltools::tagAppendAttributes(
      .cssSelector = "nav",
      class = "navbar-expand"
    )
}
