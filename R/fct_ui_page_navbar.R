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
          "Filters", icon = bsicons::bs_icon("filter")
        )
      )
    ),
    bslib::nav_panel(
      title = "Fairbanks",
      bslib::navset_card_underline(
        title = "Fairbanks North Star Borough",
        id = "fnsb",
        bslib::nav_panel(
          title = "PM2.5"
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
