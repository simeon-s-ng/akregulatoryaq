#' ui_page_navbar 
#'
#' @description Wrapper for main page navbar.
#'
#' @return A bslib::page_navbar()
#'
#' @noRd
ui_page_navbar <- function() {
  bslib::page_navbar(
    id = "nav",
    theme = ui_theme(),
    inverse = TRUE,
    fillable = FALSE,
    # Styling for sidebar button
    htmltools::tags$head(
      htmltools::tags$style(
        htmltools::HTML(
          "
            .bslib-sidebar-layout > .collapse-toggle {
              margin-top: 10px;
              background-color: #3B4F73;
            }
            .bslib-sidebar-layout > .collapse-toggle > .collapse-icon {
              fill: white !important;
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
            fbx_pm25_info()
          ),
          # Fairbanks PM10 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Fairbanks' & input.fnsb == 'PM10'",
            mod_filter_data_ui(
              "filter_data_fbx_pm10",
              range_pm10_fbx(),
              fbx_sites_pm10()
            ),
            fbx_pm10_info()
          ),
          # Anchorage PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Anchorage' & input.anc == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_anc_pm25",
              range_pm25(),
              anc_sites_pm25()
            ),
            anc_pm25_info()
          ),
          # Juneau PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Juneau' & input.jnu == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_jnu_pm25",
              range_pm25(),
              jnu_sites_pm25()
            ),
            jnu_pm25_info()
          ),
          # Mat-Su PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Mat-Su' & input.ms == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_ms_pm25",
              range_pm25(),
              matsu_sites_pm25()
            ),
            ms_pm25_info()
          ),
          # Bethel PM25 Filters ----
          shiny::conditionalPanel(
            condition = "input.nav == 'Bethel' & input.sw == 'PM2.5'",
            mod_filter_data_ui(
              "filter_data_sw_pm25",
              range_pm25_bethel(),
              bethel_sites_pm25()
            ),
            sw_pm25_info()
          )
        ),
        mod_download_ui("download"),
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
          plot_card_pm25("pm25_avg_fbx", "pm25_epa_dv_fbx", "pm25_dec_dv_fbx")
        ),
        bslib::nav_panel(
          title = "PM10",
          plot_card(mod_pm10_avg_ui("pm10_avg_fbx"), mod_pm10_dv_ui("pm10_dv_fbx"))
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
          plot_card_pm25("pm25_avg_anc", "pm25_epa_dv_anc", "pm25_dec_dv_anc")
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
          plot_card_pm25("pm25_avg_jnu", "pm25_epa_dv_jnu", "pm25_dec_dv_jnu")
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
          plot_card_pm25("pm25_avg_ms", "pm25_epa_dv_ms", "pm25_dec_dv_ms")
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
          plot_card_pm25("pm25_avg_sw", "pm25_epa_dv_sw", "pm25_dec_dv_sw")
        )
      ),
      ui_footer()
    )
  ) |> 
    htmltools::tagAppendAttributes(
      .cssSelector = "nav",
      class = "navbar-expand"
    )
}
