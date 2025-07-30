#' fbx_pm25_desc
#'
#' @noRd
fbx_pm25_desc <- function() {
  shiny::markdown(
    "
    The Fairbanks area is a <a href='https://dec.alaska.gov/air/anpms/communities/fbks-particulate-matter/' target='_blank'>Nonattainment area for <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr></a>. The State Office Building monitor was used to originally designate the FNSB <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> Nonattainment Area in 2009. The charts below show historical data from this monitor and the downtown Fairbanks NCore monitor located nearby. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **200 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' fbx_pm10_desc
#'
#' @noRd
fbx_pm10_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> began on February 23, 2011. The charts below show historical data from this monitor. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **260 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' fbx_co_desc
#'
#' @noRd
fbx_co_desc <- function() {
  shiny::markdown(
    "
    The Fairbanks area is a <a href='https://dec.alaska.gov/air/anpms/communities/co-fairbanks/' target='_blank'>limited maintenance area for <abbr title='carbon monoxide'>CO</abbr></a>. The charts below show historical data from monitors in the Fairbanks area. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **10 <abbr title='parts per million'>ppm</abbr>**.
    "
  )
}

#' fbx_so2_desc
#'
#' @noRd
fbx_so2_desc <- function() {
  shiny::markdown(
    "
    The <abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> site is located in downtown Fairbanks. Monitoring for <abbr title='sulfur dioxide'>SO<sub>2</sub></abbr> began August 18, 2011. The charts below show historical data from this monitor. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **80 <abbr title='parts per billion'>ppb</abbr>**.
    "
  )
}

#' fbx_o3_desc
#'
#' @noRd
fbx_o3_desc <- function() {
  shiny::markdown(
    "
    The <abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> site is located in downtown Fairbanks. Monitoring for <abbr title='ozone'>O<sub>3</sub></abbr> began August 3, 2011. The charts below show historical data from this monitor. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **0.100 <abbr title='parts per million'>ppm</abbr>**.
    "
  )
}

#' fbx_no2_desc
#'
#' @noRd
fbx_no2_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for <abbr title='nitrogen dioxide'>NO<sub>2</sub></abbr> occurred between July 1, 2014 and October 1, 2019. The charts below show historical data from this monitor. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **120 <abbr title='parts per billion'>ppb</abbr>**.
    "
  )
}

#' anc_pm25_desc
#'
#' @noRd
anc_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> monitoring at Anchorage and Eagle River monitoring sites. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axes of these charts extends to **100 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' anc_pm10_desc
#'
#' @noRd
anc_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> monitoring at Anchorage and Eagle River monitoring sites. There are only two remaining sites in Anchorage - Garden and Laurel. Laurel is a maximum impact site. The Eagle River area is a <a href='https://dec.alaska.gov/air/anpms/communities/pm10-eagle-river/' target='_blank'>limited maintenance area for <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr></a>. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> concentrations are made at standard conditions and are corrected for local temperature and pressure. The vertical axes of these charts extends to **260 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**.
    "
  )
}

#' anc_co_desc
#'
#' @noRd
anc_co_desc <- function() {
  shiny::markdown(
    "
    The Anchorage Garden site is located in the Anchorage <abbr title='carbon monoxide'>CO</abbr> maintenance area. The charts below show historical data from this monitor. The <abbr title='carbon monoxide'>CO</abbr> season is in winter, although in 2020, <abbr title='Department of Environmental Conservation'>DEC</abbr> started year-round monitoring. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **10 <abbr title='parts per million'>ppm</abbr>**.
    "
  )
}

#'jnu_pm25_desc
#'
#' @noRd
jnu_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> monitoring at Juneau monitoring sites. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **100 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.<br><br>

    **Note:** The <abbr title='Environmental Protection Agency'>EPA</abbr> correction factor has been applied to data for 2021-2023.
    "
  )
}

#' jnu_pm10_desc
#'
#' @noRd
jnu_pm10_desc <- function() {
  shiny::markdown(
    "
    The Juneau Floyd Dryden site is located in the <a href='https://dec.alaska.gov/air/anpms/communities/pm10-juneau/' target='_blank'>Juneau Mendenhall Valley <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> maintenance area</a>. The charts below show historical data from this monitor. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **260 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' ms_pm25_desc
#'
#' @noRd
ms_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from this monitor. The Palmer monitor operated between January 1, 2010 and July 24, 2019 and was shut down due to budget cuts. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **100 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' ms_pm10_desc
#'
#' @noRd
ms_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from this monitor. The Palmer monitor operated between January 1, 2011 and July 24, 2019 and was shut down due to budget cuts. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **260 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' sw_pm25_desc
#'
#' @noRd
sw_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> monitoring at the Bethel air quality monitoring site. Sampling began on May 31st, 2018 and ended in June 2020. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **100 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' sw_pm10_desc
#'
#' @noRd
sw_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> monitoring at the Bethel air quality monitoring site. Sampling began on June 6th, 2018 and ended in June 2020. The <a href='https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/' target='_blank'>Alaska Air Monitoring Plan</a> contains more information about these sites and <a href='https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/' target='_blank'>Realtime Air Quality Data</a> is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **260 <abbr title='micrograms per meter cubed'>µg/m<sup>3</sup></abbr>**. The <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}
