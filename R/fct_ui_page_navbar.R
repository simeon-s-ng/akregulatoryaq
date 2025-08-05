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

  js <- "
  var observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
          var attributeValue = $(mutation.target).prop(mutation.attributeName);
          if (mutation.attributeName === 'tabindex' && attributeValue == '-1') {
              $(mutation.target).prop(mutation.attributeName, '0');
          }
      });
  });

  $('*').each(function() {
      observer.observe(this, {
          attributes: true
      });
  });
  "

  bslib::page_navbar(
    id = "nav",
    theme = ui_theme(),
    header = tags$script(HTML(js)),
    inverse = TRUE,
    fillable = FALSE,
    # Styling for sidebar button and link
    htmltools::tags$head(
      htmltools::tags$style(
        htmltools::HTML(
          "
            .bslib-sidebar-layout > .collapse-toggle {
              margin-top: 10px;
              padding: 10px 0px;
              background-color: #194A6B;
              border: 2px #F7F5F2;
              box-shadow: 0 8px 16px 0 rgba(0,0,0,0.5), 0 6px 20px 0 rgba(0,0,0,0.19)
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
            .filter-card {
              border-color: black;
              border-radius: 5px;
              float: left;
              margin-top: 5px;
              margin-right: 5px;
              width: auto;
              padding: 0px;
              border: 0px;
              left: -2.5px;
            }
            .filter-card-body {
              border-color: black;
              border-radius: 5px;
              padding: 0px;
            }
            .filter-button {
              border-color: black;
              border-radius: 5px;
              box-shadow: 0px 0px 0px 1px rgba(0,0,0,0.1);
              background-color: #072F49;
              padding: 5px;
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
    # Offcanvas sidebar ----
    bslib::card(bslib::card_body(bsutils::offcanvas(
      bsutils::offcanvasButton(
        "Filters", bs_icon("filter"), class = "filter-button"
      ),
      bsutils::offcanvasContent(
        bsutils::offcanvasHeader("Filters"),
        htmltools::div(
        bslib::accordion(
          bslib::accordion_panel(
            "Filters", icon = bsicons::bs_icon("filter"),
            # Fairbanks PM25 Filters ----
            shiny::conditionalPanel(
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'pm25'",
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
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'pm10'",
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
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'co'",
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
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'so2'",
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
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'o3'",
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
              condition = "input.nav == 'Fairbanks' & input.fnsb == 'no2'",
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
              condition = "input.nav == 'Anchorage' & input.anc == 'pm25'",
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
              condition = "input.nav == 'Anchorage' & input.anc == 'pm10'",
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
              condition = "input.nav == 'Anchorage' & input.anc == 'co'",
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
              condition = "input.nav == 'Juneau' & input.jnu == 'pm25'",
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
              condition = "input.nav == 'Juneau' & input.jnu == 'pm10'",
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
              condition = "input.nav == 'Mat-Su' & input.ms == 'pm25'",
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
              condition = "input.nav == 'Mat-Su' & input.ms == 'pm10'",
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
              condition = "input.nav == 'Bethel' & input.sw == 'pm25'",
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
              condition = "input.nav == 'Bethel' & input.sw == 'pm10'",
              mod_filter_data_ui(
                "filter_data_sw_pm10",
                range_pm25_bethel(),
                bethel_sites_pm25()
              ),
              sw_pm10_info(),
              mod_download_ui("dl_pm10_sw")
            )
          )
        ),
        open = "Filters"
      )
      )
    ), class = "filter-card-body"), class = "filter-card"),
    # REGION PAGES -------------------------------------------------------------
    # Fairbanks ----
    bslib::nav_panel(
      title = "Fairbanks",
      bslib::navset_card_underline(
        title = "Fairbanks North Star Borough",
        id = "fnsb",
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title="particulate matter less than 2.5 microns in size", 'PM',
            htmltools::tags$sub('2.5', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm25',
          bslib::card(
            bslib::card_header(
              "Fairbanks",
              htmltools::tags$abbr(
                title='particulate matter less than 2.5 microns in size', 'PM',
                htmltools::tags$sub('2.5', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 10 microns in size', 'PM',
            htmltools::tags$sub('10', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = "pm10",
          bslib::card(
            bslib::card_header(
              "Fairbanks",
              htmltools::tags$abbr(
                title='particulate matter less than 10 microns in size', 'PM',
                htmltools::tags$sub('10', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
            fbx_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_fbx"),
            mod_pm10_dv_ui("pm10_dv_fbx"),
            mod_naaqs_table_ui("pm10_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='carbon monoxide', 'CO',
            .noWS = "outside"
          ),
          value = "co",
          bslib::card(
            bslib::card_header(
              "Fairbanks ",
              htmltools::tags$abbr(
                title='carbon monoxide', 'CO',
                .noWS = "outside"
              ),
            ),
            fbx_co_desc()
          ),
          plot_card(
            mod_co_avg_ui("co_avg_fbx"),
            mod_co_dv_ui("co_dv_fbx"),
            mod_naaqs_table_ui("co_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='sulfur dioxide', 'SO',
            htmltools::tags$sub('2', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = "so2",
          bslib::card(
            bslib::card_header(
              "Fairbanks",
              htmltools::tags$abbr(
                title='sulfur dioxide', 'SO',
                htmltools::tags$sub('2', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
            fbx_so2_desc()
          ),
          plot_card(
            mod_so2_avg_ui("so2_avg_fbx"),
            mod_so2_dv_ui("so2_dv_fbx"),
            mod_naaqs_table_ui("so2_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='ozone', 'O',
            htmltools::tags$sub('3', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = "o3",
          bslib::card(
            bslib::card_header(
              "Fairbanks",
              htmltools::tags$abbr(
                title='ozone', 'O',
                htmltools::tags$sub('3', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
            fbx_o3_desc()
          ),
          plot_card(
            mod_o3_avg_ui("o3_avg_fbx"),
            mod_o3_dv_ui("o3_dv_fbx"),
            mod_naaqs_table_ui("o3_table_fbx")
          )
        ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='nitrogen dioxide', 'NO',
            htmltools::tags$sub('2', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'no2',
          bslib::card(
            bslib::card_header(
              "Fairbanks",
              htmltools::tags$abbr(
                title='nitrogen dioxide', 'NO',
                htmltools::tags$sub('2', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title="particulate matter less than 2.5 microns in size", 'PM',
            htmltools::tags$sub('2.5', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = "pm25",
          bslib::card(
            bslib::card_header(
              "Anchorage",
              htmltools::tags$abbr(
                title='particulate matter less than 2.5 microns in size',
                'PM',
                htmltools::tags$sub('2.5', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 10 microns in size', 'PM',
            htmltools::tags$sub('10', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm10',
          bslib::card(
            bslib::card_header(
              "Anchorage",
              htmltools::tags$abbr(
                title='particulate matter less than 10 microns in size', 'PM',
                htmltools::tags$sub('10', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
            anc_pm10_desc()
          ),
          plot_card(
            mod_pm10_avg_ui("pm10_avg_anc"),
            mod_pm10_dv_ui("pm10_dv_anc"),
            mod_naaqs_table_ui("pm10_table_anc")
          )
        ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='carbon monoxide', 'CO',
            .noWS = "outside"
          ),
          value = 'co',
          bslib::card(
            bslib::card_header(
              "Anchorage ",
              htmltools::tags$abbr(
                title='carbon monoxide', 'CO',
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 2.5 microns in size', 'PM',
            htmltools::tags$sub('2.5', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = "pm25",
          bslib::card(
            bslib::card_header(
              "Juneau",
              htmltools::tags$abbr(
                title='particulate matter less than 2.5 microns in size', 'PM',
                htmltools::tags$sub('2.5', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 10 microns in size', 'PM',
            htmltools::tags$sub('10', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm10',
          bslib::card(
            bslib::card_header(
              "Juneau",
              htmltools::tags$abbr(
                title='particulate matter less than 10 microns in size', 'PM',
                htmltools::tags$sub('10', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 2.5 microns in size', 'PM',
            htmltools::tags$sub('2.5', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm25',
          bslib::card(
            bslib::card_header(
              "Mat-Su",
              htmltools::tags$abbr(
                title='particulate matter less than 2.5 microns in size', 'PM',
                htmltools::tags$sub('2.5', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 10 microns in size', 'PM',
            htmltools::tags$sub('10', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm10',
          bslib::card(
            bslib::card_header(
              "Mat-Su",
              htmltools::tags$abbr(
                title='particulate matter less than 10 microns in size', 'PM',
                htmltools::tags$sub('10', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
          title = htmltools::tags$abbr(
            title='particulate matter less than 2.5 microns in size', 'PM',
            htmltools::tags$sub('2.5', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm25',
          bslib::card(
            bslib::card_header(
              "Bethel",
              htmltools::tags$abbr(
                title='particulate matter less than 2.5 microns in size', 'PM',
                htmltools::tags$sub('2.5', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
            sw_pm25_desc()
          ),
          plot_card(
            mod_pm25_avg_ui("pm25_avg_sw"),
            mod_pm25_dec_dv_ui("pm25_dec_dv_sw"),
            mod_naaqs_table_ui("pm25_table_sw")
          )
         ),
        bslib::nav_panel(
          title = htmltools::tags$abbr(
            title='particulate matter less than 10 microns in size', 'PM',
            htmltools::tags$sub('10', .noWS = "outside"),
            .noWS = "outside"
          ),
          value = 'pm10',
          bslib::card(
            bslib::card_header(
              "Bethel",
              htmltools::tags$abbr(
                title='particulate matter less than 10 microns in size', 'PM',
                htmltools::tags$sub('10', .noWS = "outside"),
                .noWS = "outside"
              ),
            ),
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
    # Link to real-time data ----
    bslib::nav_item(
      htmltools::tags$a(
        shiny::icon("wind"),
        "Alaska Real Time Air Quality Data",
        href = "https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/",
        target = "_blank",
        tabindex = "0",
        role = "tab"
      )
    )
  ) |>
    htmltools::tagAppendAttributes(
      .cssSelector = "nav",
      class = "navbar-expand"
    ) |>
    htmltools::tagAppendAttributes(
      .cssSelector = "#fnsb > .nav-item > .nav-link",
      tabIndex = "0"
    )
}
