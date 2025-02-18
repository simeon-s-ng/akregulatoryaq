#' navbar_js
#'
#' @description Navbar formatting fct
#'
#' @return Navbar formatting css string
#'
#' @noRd
navbar_js <- function() {
  "@media (max-width: 600px) {
    .navbar-collapse {
      display: block;
    }
  }"
}

#' ui_footer
#'
#' @description A bslib::card_footer with DEC links.
#'
#' @return A bslib::card_footer
#'
#' @noRd
ui_footer <- function() {
  bslib::card_footer(
    "Alaska Department of Environmental Conservation | Division of Air Quality | ",
    bslib::tooltip(
      htmltools::a(
        "https://dec.alaska.gov/air/",
        href = "https://dec.alaska.gov/air/",
        target = "_blank"
      ),
      shiny::markdown("Alaska DEC Air Quality Homepage")
    ),
    bsicons::bs_icon("box-arrow-up-right"),
    htmltools::br(),
    "Open in ",
    bslib::tooltip(
      htmltools::a(
        "shinyapps.io",
        href = "https://alaska-dec-air-monitoring-quality-assurance.shinyapps.io/akregulatoryaq/",
        target = "_blank"
      ),
      shiny::markdown("shinyapps.io External Page")
    ),
    bsicons::bs_icon("box-arrow-up-right")
  )
}

#' ui_theme
#'
#' @description A bs_theme based on DEC Theme
#'
#' @return A bs_theme.
#'
#' @noRd
ui_theme <- function() {
  bslib::bs_theme(
    version = 5,
    preset = "bootstrap",
    bg = "#FFFFFF",
    fg = "#194A6B",
    primary = "#194A6B",
    secondary = "#000000",
    "nav-link-font-size" = "14px",
    base_font = bslib::font_google("Open Sans", local = TRUE)
  ) |>
    bslib::bs_add_variables(
      "border-radius" = 0,
      "spacer" = "0.5rem"
    ) |>
    bslib::bs_add_rules(
      "
        .navbar .navbar-header,
        .navbar-collapse {
          float: none;
          displayi: inline-block;
          vertical-align: top
        }
        .navbar-header {
          position: sticky;
          width: 0%
        }
        #nav > .nav-item > .nav-link {
          color: #FFFFFF
        }
      "
    )
}
