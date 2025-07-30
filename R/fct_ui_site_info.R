#' fbx_pm25_info
#'
#' @description Markdown of FBX PM2.5 site information
#'
#' @return A bslib card with site information
#'
#' @noRd
fbx_pm25_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**</a> began monitoring <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in 2009 and is located in Downtown Fairbanks, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-a-street/' target='_blank'>**A Street Site**</a> began monitoring <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in 2019 and is located in Fairbanks, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/north-pole-hurst-road/' target='_blank'>**Hurst Road Site**</a> began monitoring <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in 2012 and is located in North Pole, AK."
      ),
      shiny::markdown(
        "The **Fairbanks State Office Building** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Fairbanks, AK between 2000-2020.<br>"
      ),
      shiny::markdown(
        "The **Nordale** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Fairbanks, AK between 2007-2009.<br>"
      ),
      shiny::markdown(
        "The **Woodriver** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Fairbanks, AK between 2010-2011.<br>"
      )
    )
  )
}

#' fbx_pm10_info
#'
#' @noRd
fbx_pm10_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**</a> began monitoring <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in 2011 and is located in Downtown Fairbanks, AK."
      )
    )
  )
}

#' fbx_co_info
#'
#' @noRd
fbx_co_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**</a> began monitoring <abbr title='carbon monoxide'>CO</abbr> in 2011 and is located in Downtown Fairbanks, AK."
      ),
      shiny::markdown(
        "The **Armory** Site monitored <abbr title='carbon monoxide'>CO</abbr> in Fairbanks, AK between 2002-2007."
      ),
      shiny::markdown(
        "The **Hunter Elementary** Site monitored <abbr title='carbon monoxide'>CO</abbr> in Fairbanks, AK between 2000-2009."),
      shiny::markdown(
        "The **Old Post Office** Site monitored <abbr title='carbon monoxide'>CO</abbr> in Fairbanks, AK between 2000-2014."
      )
    )
  )
}

#' fbx_so2_info
#'
#' @noRd
fbx_so2_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/north-pole-hurst-road/' target='_blank'>**Hurst Road Site**</a> began monitoring <abbr title='sulfur dioxide'>SO<sub>2</sub></abbr> in 2022 and is located in North Pole, AK."
      ),
      shiny::markdown(
        "The [**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**](https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/) began monitoring <abbr title='sulfur dioxide'>SO<sub>2</sub></abbr> in 2011 and is located in Downtown Fairbanks, AK.")
    )
  )
}

#' fbx_o3_info
#'
#' @noRd
fbx_o3_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**</a> began monitoring <abbr title='ozone'>O<sub>3</sub></abbr> in 2011 and is located in Downtown Fairbanks, AK."
      )
    )
  )
}

#' fbx_no2_info
#'
#' @noRd
fbx_no2_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**<abbr title='National Core Multi-Pollutant Monitoring Station'>NCore</abbr> Site**</a> began monitoring <abbr title='nitrogen dioxide'>NO<sub>2</sub></abbr> in 2012 and is located in Downtown Fairbanks, AK."
      )
    )
  )
}

#' anc_pm25_info
#'
#' @noRd
anc_pm25_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/anchorage-garden/' target='_blank'>**Garden Site**</a> is located in Airport Heights, Anchorage, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/eagle-river-parkgate/' target='_blank'>**Parkgate Site**</a> is located in Eagle River, AK."
      ),
      shiny::markdown(
        "The **DHHS** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Anchorage, AK between 2009-2012."
      ),
      shiny::markdown(
        "The **Tudor** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Anchorage, AK between 2000-2002"
      )
    )
  )
}

#' anc_pm10_info
#'
#' @noRd
anc_pm10_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/anchorage-garden/' target='_blank'>**Garden Site**</a> is located in Airport Heights Anchorage, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/eagle-river-parkgate/' target='_blank'>**Parkgate Site**</a> is located in Eagle River, AK."
      ),
      shiny::markdown(
        "The **DHHS** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Anchorage, AK between 2009-2012."
      ),
      shiny::markdown(
        "The **Muldoon** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Anchorage, AK between 2000-2005."
      ),
      shiny::markdown(
        "The **Tudor** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Anchorage, AK between 2000-2014."
      )
    )
  )
}

#' anc_co_info
#'
#' @noRd
anc_co_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/anchorage-garden/' target='_blank'>**Garden Site**</a> is located in Airport Heights Anchorage, AK."
      )
    )
  )
}

#' jnu_pm25_info
#'
#' @noRd
jnu_pm25_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/juneau-floyd-dryden/' target='_blank'>**Floyd Dryden Site**</a> is located in Juneau, AK."
      ),
      shiny::markdown(
        "The **Lemon Creek** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Juneau, AK between 2000-2001."
      )
    )
  )
}

#' jnu_pm10_info
#'
#' @noRd
jnu_pm10_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/juneau-floyd-dryden/' target='_blank'>**Floyd Dryden Site**</a> is located in Juneau, AK."
      )
    )
  )
}

#' ms_pm25_info
#'
#' @noRd
ms_pm25_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/palmer-pmc/' target='_blank'>**<abbr title='Plant Materials Center'>PMC</abbr> Site**</a> is located in Palmer, AK"
      ),
      shiny::markdown(
        "The **Butte** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Butte, AK between 2000-2023."
      ),
      shiny::markdown(
        "The **Palmer** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Palmer, AK between 2010-2019."
      ),
      shiny::markdown(
        "The **Wasilla** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Wasilla, AK between 2010-2015."
      )
    )
  )
}

#' ms_pm10_info
#'
#' @noRd
ms_pm10_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/palmer-pmc/' target='_blank'>**<abbr title='Plant Materials Center'>PMC</abbr> Site**</a> is located in Palmer, AK"
      ),
      shiny::markdown(
        "The **Butte** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Butte, AK between 2000-2023."
      ),
      shiny::markdown(
        "The **Palmer** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Palmer, AK between 2011-2019."
      ),
      shiny::markdown(
        "The **Wasilla** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Wasilla, AK between 2010-2015."
      )
    )
  )
}

#' sw_pm25_info
#'
#' @noRd
sw_pm25_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The **Bethel** Site monitored <abbr title='particulate matter less than 2.5 microns in size'>PM<sub>2.5</sub></abbr> in Bethel, AK between 2018-2019"
      )
    )
  )
}

#' sw_pm10_info
#'
#' @noRd
sw_pm10_info <- function() {
  bslib::card(
    bslib::card_header("Site Information"),
    bslib::card_body(
      shiny::markdown(
        "The **Bethel** Site monitored <abbr title='particulate matter less than 10 microns in size'>PM<sub>10</sub></abbr> in Bethel, AK between 2018-2019"
      )
    )
  )
}
