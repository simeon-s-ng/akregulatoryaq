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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**NCore Site**</a> is located in Downtown Fairbanks, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-a-street/' target='_blank'>**A Street Site**</a> is located in Fairbanks, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/north-pole-hurst-road/' target='_blank'>**Hurst Road Site**</a> is located in North Pole, AK."
      ),
      shiny::markdown(
        "The **Fairbanks State Office Building** Site monitored PM2.5 in Fairbanks, AK between 2000-2020.<br>"
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**NCore Site**</a> is located in Downtown Fairbanks, AK."
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**NCore Site**</a> is located in Downtown Fairbanks, AK."
      ),
      shiny::markdown(
        "The **Armory** Site monitored CO in Fairbanks, AK between 2002-2007."
      ),
      shiny::markdown(
        "The **Hunter Elementary** Site monitored CO in Fairbanks, AK between 2000-2009."),
      shiny::markdown(
        "The **Old Post Office** Site monitored CO in Fairbanks, AK between 2000-2014."
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/north-pole-hurst-road/' target='_blank'>**Hurst Road Site**</a> is located in North Pole, AK."
      ),
      shiny::markdown(
        "The [**NCore Site**](https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/) is located in Downtown Fairbanks, AK.")
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**NCore Site**</a> is located in Downtown Fairbanks, AK."
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/fairbanks-ncore/' target='_blank'>**NCore Site**</a> is located in Downtown Fairbanks, AK."
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
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/anchorage-garden/' target='_blank'>**Garden Site**</a> is located in Airport Heights Anchorage, AK."
      ),
      shiny::markdown(
        "The <a href='https://dec.alaska.gov/air/air-monitoring/instruments-sites/site-info/eagle-river-parkgate/' target='_blank'>**Parkgate Site**</a> is located in Eagle River, AK."
      ),
      shiny::markdown(
        "The **DHHS** Site monitored PM2.5 in Anchorage, AK between 2009-2012."
      ),
      shiny::markdown(
        "The **Tudor** Site monitored PM2.5 in Anchorage, AK between 2000-2002"
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
        "The **DHHS** Site monitored PM10 in Anchorage, AK between 2009-2012."
      ),
      shiny::markdown(
        "The **Muldoon** Site monitored PM10 in Anchorage, AK between 2000-2005."
      ),
      shiny::markdown(
        "The **Tudor** Site monitored PM10 in Anchorage, AK between 2000-2014."
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
        "The **Lemon Creek** Site monitored PM2.5 in Juneau, AK between 2000-2001."
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
        "The **Butte** Site monitored PM2.5 in Butte, AK between 2000-2023."
      ),
      shiny::markdown(
        "The **Palmer** Site monitored PM2.5 in Palmer, AK between 2010-2019."
      ),
      shiny::markdown(
        "The **Wasilla** Site monitored PM2.5 in Wasilla, AK between 2010-2015."
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
        "The **Butte** Site monitored PM10 in Butte, AK between 2000-2023."
      ),
      shiny::markdown(
        "The **Palmer** Site monitored PM10 in Palmer, AK between 2011-2019."
      ),
      shiny::markdown(
        "The **Wasilla** Site monitored PM10 in Wasilla, AK between 2010-2015."
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
        "The **Bethel** Site monitored PM2.5 in Bethel, AK between 2018-2019"
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
        "The **Bethel** Site monitored PM10 in Bethel, AK between 2018-2019"
      )
    )
  )
}
