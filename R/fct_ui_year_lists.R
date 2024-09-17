## fct_ui_year_lists.R
## Range of years DEC has air monitoroing data for or to display on site.

#' range_pm25
#'
#' @description Wrapper for region & pollutant specific year ranges for conditional filters
#'
#' @return A seq of a given year range
#'
#' @noRd
range_pm25 <- function() {
  get_range("2000", "2023")
}

#' range_pm10
#' 
#' @noRd
range_pm10 <- function() {
  get_range("2000", "2023")
}

#' range_co
#' 
#' @noRd
range_co <- function() {
  get_range("2000", "2023")
}

#' range_so2
#' 
#' @noRd
range_so2 <- function() {
  get_range("2011", "2023")
}

#' range_o3
#' 
#' @noRd
range_o3 <- function() {
  get_range("2011", "2023")
}

#' range_no2
#' 
#' @noRd
range_no2 <- function() {
  get_range("2014", "2019")
}

#' range_pm10_fbx
#' 
#' @noRd
range_pm10_fbx <- function() {
  get_range("2012", "2023")
}

#' range_pm25_bethel
#' 
#' @noRd
range_pm25_bethel <- function() {
  get_range("2018", "2019")
}

#' range_pm10_bethel
#' 
#' @noRd
range_pm10_bethel <- function() {
  get_range("2018", "2019")
}
