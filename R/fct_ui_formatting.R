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
      htmltools::a("https://dec.alaska.gov/air/", href = "https://dec.alaska.gov/air/"),
      shiny::markdown("Alaska DEC Air Quality Homepage")
    )
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
    bg = "#F7F5F2",
    fg = "#194A6B",
    primary = "#000000",
    secondary = "#194A6B",
    "nav-link-font-size" = "14px",
    base_font = bslib::font_google("Open Sans", local = TRUE)
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
      "
    )
}
