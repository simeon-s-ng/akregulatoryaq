#' fbx_pm25_desc
#' 
#' @noRd
fbx_pm25_desc <- function() {
  shiny::markdown(
    "
    The State Office Building monitor was used to originally designate the FNSB PM2.5 Nonattainment Area in 2009. The charts below show historical data from this monitor and the downtown Fairbanks NCore monitor located nearby. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **100 µg/m³**. The PM2.5 concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' fbx_pm10_desc
#' 
#' @noRd
fbx_pm10_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for PM10 began on February 23, 2011. The charts below show historical data from this monitor. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
      
    **Note:** The vertical axis of these charts extends to **200 µg/m³**. The PM10 concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' fbx_co_desc
#' 
#' @noRd
fbx_co_desc <- function() {
  shiny::markdown(
    "
    The Fairbanks area is a [limited maintenance area for CO](https://dec.alaska.gov/air/anpms/communities/co-fairbanks/). The charts below show historical data from monitors in the Fairbanks area. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **10 ppm**.
    "
  )
}

#' fbx_so2_desc
#' 
#' @noRd
fbx_so2_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for SO2 began August 18, 2011. The charts below show historical data from this monitor. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **80 ppb**.
    "
  )
}

#' fbx_o3_desc
#' 
#' @noRd
fbx_o3_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for O3 began August 3, 2011. The charts below show historical data from this monitor. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **0.100 ppm**.
    "
  )
}

#' fbx_no2_desc
#' 
#' @noRd
fbx_no2_desc <- function() {
  shiny::markdown(
    "
    The NCore site is located in downtown Fairbanks. Monitoring for NO2 occurred between July 1, 2014 and October 1, 2019. The charts below show historical data from this monitor. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **120 ppb**.
    "
  )
}

#' anc_pm25_desc
#' 
#' @noRd
anc_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from PM2.5 monitoring at Anchorage monitoring sites. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axes of these charts extends to **100 µg/m³**. The PM2.5 concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure. 
    "
  )
}

#' anc_pm10_desc
#' 
#' @noRd
anc_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from PM10 monitoring at Anchorage monitoring sites. There are only two remaining sites in Anchorage - Garden and Laurel. Laurel is a maximum impact site. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
      
    **Note:** The PM10 concentrations are made at standard conditions and are corrected for local temperature and pressure. The vertical axes of these charts extends to **200 µg/m³**.
    "
  )
}

#' anc_co_desc
#' 
#' @noRd
anc_co_desc <- function() {
  shiny::markdown(
    "
    The Anchorage Garden site is located in the Anchorage CO maintenance area. The charts below show historical data from this monitor. The CO season is in winter, although in 2020, DEC started year-round monitoring. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **10 ppm**.
    "
  )
}

#'jnu_pm25_desc
#' 
#' @noRd
jnu_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from PM2.5 monitoring at Juneau monitoring sites. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about these sites and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **100 µg/m³**. The PM2.5 concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.<br><br>
    
    **Note:** The EPA correction factor has been applied to data for 2021-2023.
    "
  )
}

#' jnu_pm10_desc
#' 
#' @noRd
jnu_pm10_desc <- function() {
  shiny::markdown(
    "
    The Juneau Floyd Dryden site is located in the Juneau Mendenhall Valley PM10 maintenance area. The charts below show historical data from this monitor. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **200 µg/m³**. The PM10 concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' ms_pm25_desc
#' 
#' @noRd
ms_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from this monitor. The Palmer monitor operated between January 1, 2010 and July 24, 2019 and was shut down due to budget cuts. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>
    
    **Note:** The vertical axis of these charts extends to **100 µg/m³**. The PM2.5 concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' ms_pm10_desc
#' 
#' @noRd
ms_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from this monitor. The Palmer monitor operated between January 1, 2011 and July 24, 2019 and was shut down due to budget cuts. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **200 µg/m³**. The PM10 concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}

#' sw_pm25_desc
#' 
#' @noRd
sw_pm25_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from PM2.5 monitoring at the Bethel air quality monitoring site. Sampling began on May 31st, 2018 and ended in June 2020. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **100 µg/m³**. The PM2.5 concentrations represent the concentration at local conditions and have not been corrected for local temperature and pressure.
    "
  )
}

#' sw_pm10_desc
#' 
#' @noRd
sw_pm10_desc <- function() {
  shiny::markdown(
    "
    The interactive charts below show historical data from PM10 monitoring at the Bethel air quality monitoring site. Sampling began on June 6th, 2018 and ended in June 2020. The [Alaska Air Monitoring Plan](https://dec.alaska.gov/air/air-monitoring/guidance/monitoring-plans/) contains more information about this site and [Realtime Air Quality Data](https://dec.alaska.gov/air/air-monitoring/responsibilities/database-management/alaska-air-quality-real-time-data/) is available for the public.<br><br>

    **Note:** The vertical axis of these charts extends to **200 µg/m³**. The PM10 concentrations are made at standard conditions and are corrected for local temperature and pressure.
    "
  )
}