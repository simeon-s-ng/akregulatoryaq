## FAIRBANKS SITE LISTS --------------------------------------------------------

#' fbx_sites_pm25
#'
#' @description List of FBX sites
#'
#' @return List of strings of sites
#'
#' @noRd
fbx_sites_pm25 <- function() {
  c("A Street", "FSOB", "Hurst Road", "NCore")
}

#' fbx_sites_pm10
#'
#' @noRd
fbx_sites_pm10 <- function() {
  "NCore"
}

#' fbx_sites_co
#'
#' @noRd
fbx_sites_co <- function() {
  c("Armory", "FSOB", "Hunter", "NCore", "Old Post Office")
}

#' fbx_sites_so2
#'
#' @noRd
fbx_sites_so2 <- function() {
  c("Hurst Road", "NCore")
}

## ANCHORAGE SITE LISTS --------------------------------------------------------

#' anc_sites_pm25
#'
#' @noRd
anc_sites_pm25 <- function() {
  c("DHHS", "Garden", "Parkgate", "Tudor")
}

#' anc_sites_pm10
#'
#' @noRd
anc_sites_pm10 <- function() {
  c("DHHS", "Garden", "Laurel", "Muldoon", "Parkgate", "Tudor")
}

#' anc_sites_co
#'
#' @noRd
anc_sites_co <- function() {
  c("DHHS", "Garden", "Parkgate", "Turnagain")
}

## JUNEAU SITE LISTS -----------------------------------------------------------

#' jnu_sites_pm25
#'
#' @noRd
jnu_sites_pm25 <- function() {
  c("Floyd Dryden", "Lemon Creek")
}

#' jnu_sites_pm10
#'
#' @noRd
jnu_sites_pm10 <- function() {
  "Floyd Dryden"
}

## MATSU SITE LISTS ------------------------------------------------------------
## WILL NEED TO UPDATE WHEN PMC DATA COMES IN

#' matsu_sites_pm25
#'
#' @noRd
matsu_sites_pm25 <- function() {
  c("Butte", "Palmer", "PMC", "Wasilla")
}

#' matsu_sites_pm10
#'
#' @noRd
matsu_sites_pm10 <- function() {
  c("Butte", "Palmer", "PMC", "Wasilla")
}

## BETHEL SITE LIST ------------------------------------------------------------

#' bethel_sites_pm25
#'
#' @noRd
bethel_sites_pm25 <- function() {
  "Bethel"
}

#' bethel_sites_pm10
#'
#' @noRd
bethel_sites_pm10 <- function() {
  "Bethel"
}

## DATASETS FOR DOWNLOAD -------------------------------------------------------

#' datasets_dl
#'
#' @noRd
datasets_dl <- function() {
  c("PM2.5", "PM10", "CO", "SO2", "O3", "NO2")
}
