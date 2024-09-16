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
    sidebar = bslib::sidebar(
      open = FALSE,
      padding = c(10, 15),
      gap = 10,
      width = "40%",
      bslib::accordion(
        bslib::accordion_panel(
          "Filters", icon = bsicons::bs_icon("filter"),
          # Fairbanks PM25 Filters ---------------------------------------------
          shiny::conditionalPanel(  
            condition = paste0("input.nav == 'Fairbanks' & input.fnsb == 'PM2.5'"),
            # PM25 Year Filter Module
            mod_filter_data_ui(
              "filter_data_fbx_pm25", 
              get_range("2000", "2023"),
              fbx_sites_pm25()
            ),
            bslib::card(
              bslib::card_header("Site Information"),
              bslib::card_body(
                shiny::markdown(
                  "The [**NCore Site**](https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/) is located in Downtown Fairbanks, AK."
                ),
                shiny::markdown(
                  "The [**A Street**](https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-a-street/) is located in Fairbanks, AK."
                ),
                shiny::markdown(
                  "The [**Hurst Road**](https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/north-pole-hurst-road/) is located in North Pole, AK."
                ),
                shiny::markdown(
                  "The **Fairbanks State Office Building** Site monitored PM2.5 in Fairbanks, AK between 2000-2020.<br>"
                )     
              )
            )
          )
        )
      )
    ),
    bslib::nav_panel(
      title = "Fairbanks",
      bslib::navset_card_underline(
        title = "Fairbanks North Star Borough",
        id = "fnsb",
        bslib::nav_panel(
          title = "PM2.5",
          mod_pm25_avg_ui("pm25_avg_fbx")
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
