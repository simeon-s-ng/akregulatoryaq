#' gaf_palette
#' 
#' @description gaf color palette for accessibility
#' 
#' @return A color palette
#' 
#' @noRd
gaf_palette <- function() {
  c(
    "#12436D", 
    "#28A197",
    "#801650",
    "#F46A25", 
    "#3D3D3D", 
    "#A285D1"
  )
}

#' get_glossary
#' 
#' @description Get glossary in markdown format
#' 
#' @return A markdown() with glossary text.
#' 
#' @noRd
get_glossary <- function() {
  shiny::markdown(
    "**NAAQS**<br>
          National Ambient Air Quality Standard - A health-based air quality 
          standard set by EPA based on a review of available scientific information. 
          NAAQS exist for criteria pollutants including Particulate Matter 
          (PM2.5 and PM10), Carbon Monoxide (CO), Sulfur Dioxide (SO2), 
          Nitrogen Dioxide (NO2), Ozone(O3), and Lead(Pb).<br>
          [EPA's NAAQS Webpage](https://www.epa.gov/naaqs)<br>
          <br>
          **Concentration, µg/m³**<br>
          The amount of PM2.5 suspended in the air with units of micrograms(one-millionth of a gram) 
          per cubic meter<br>
          <br>
          **Exceedance**<br>
          A day when the 24-hour measured concentration of PM2.5 exceeds the NAAQS.<br>
          <br>
          **98th Percentile**<br>
          The daily value out of a year of PM2.5 monitoring data below which 98 
          percent of all daily values fall. 
          [40 CFR 50 Appendix N - see section 4.5(a) (PDF)](https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf)<br>
          <br>
          **24-hour Design Value (DV)**<br>
          A three-year average of the 98th percentile value. An area is in 
          violation of the NAAQS when the Design Values is greater than the 
          24-hour NAAQS for PM2.5, which is currently set at 35 µg/m³
          [40 CFR 50 Appendix N - see section 4.5(b) (PDF)](https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf)<br>
          <br>
          **Clean Data Year**<br>
          A year when the 98th percentile value is less than the NAAQS.<br>
          <br>
          **Exceptional Events**<br>
          Unusual or naturally occurring events that can affect air quality 
          but are not reasonably controllable.<br>
          [EPA's Exceptional Events Webpage](https://www.epa.gov/air-quality-analysis/treatment-air-quality-monitoring-data-influenced-exceptional-events/)<br>
          [DEC's Exceptional Events Webpage](https://dec.alaska.gov/air/air-monitoring/guidance/exceptional-events/)<br>
          <br>
          **Compliance with PM2.5 NAAQS**<br>
          24-Hour: 98th percentile, averaged over 3 years, must be below the 
          standardAnnual: Annual arithmetic mean, averaged over 3 years, 
          must be below the standard. 
          [40 CFR 50 Appendix N - see sections 4.1 and 4.2 (PDF)](https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf)"
  )
}

#' get_howto
#' 
#' @description Get How To in markdown format
#' 
#' @return A markdown() of how to use the Shiny App
#' 
#' @noRd
get_howto <- function() {
  shiny::markdown(
    "To filter by year (2000 and after) and site, view additional site information, 
    or download data click the left-hand menu by clicking **>**. 
    To collapse this menu and view the data figure as a larger figure click **<**.
    - Site selection defaults to all sites in the region, to unselect or select sites, 
    click the site/s in the site dropdown.
    - Additional site information, for the sites in the selected region can be found
    in the “Site Information” box below the site selection dropdown. 
    Click on the site name link to be redirected to the monitoring site’s webpage for further information.
    - For data downloads you can download all years (2000 and after) and all sites 
    for one pollutant (PM2.5, PM10, CO, SO2, O3, or NO2) at a time. 
    To view data of various pollutants (PM2.5, PM10, CO, SO2, O3, or NO2) 
    select a pollutant above the Air Quality Monitoring Data figure.
    
    <!-- end of the list -->
    
    
    Hover over data points on the figure to see the date and the exact value of that data point.<br><br>
    To zoom in on the x-axis only click and drag the cursor from left to right or 
    right to left over the graph. To zoom in on the y-axis only click and drag the 
    cursor from top to bottom or bottom to top over the graph. 
    To zoom in on an area click and drag and drop the cursor over the area of interest. 
    To reset to the original zoom double click.<br><br>
    To toggle sites on and off in the figure click on the site name in the site legend below the figure.<br><br>
    Hover over the figure to see additional figure options to the right of the figure title. Additional options include: 
    - Downloading the figure as a png file by clicking on the camera icon that says 
    “Download plot as png” when hovered over.
    - Zooming in on a selection by clicking on the magnifying glass with a square 
    in the middle that says “Zoom” when hovered over.
    - Moving around within the figure by clicking on the icon with arrows pointing 
    in the four cardinal directions that says “Pan” when hovered over.
    - Highlighting a rectangular portion of the figure by clicking on the icon 
    with a rectangle with dashed lines that says “Box Select” when hovered over. 
    - Highlighting a freeform portion of the figure by clicking on the lasso 
    icon that says “Lasso Select” when hovered over.
    - Zoom in by clicking the square icon with a **+** sign in it that says “Zoom in” when hovered over.
    - Zoom out by clicking the square icon with a **-** sign in it that says “Zoom out” when hovered over.
    - To scale the axes of the figure to match the data click the icon with four arrows pointing out towards corners 
    that says “Autoscale” when hovered over.
    - To reset the scale of the figure, click the house icon that says “Reset axes” when hovered over.
    - To review a single data point, click the single flat arrow pointing left icon that says “Show closest data on hover” when hovered over.
    - To compare multiple data points, click the two stacked flat arrows pointing left icon that says “Compare data on hover” when hovered over.
    
    <!-- end of the list -->
    
    For more details expand the Glossary by clicking the **Glossary dropdown ⋁** below the data figure. 
    To see the National Ambient Air Quality Standards (NAAQS) set forth by EPA 
    expand the NAAQS Table by clicking the **NAAQS Table dropdown ⋁** below the data figure.<br><br>
    Dashboard will time out after 15 minutes to prevent excessive load on the server, 
    to reload just click refresh in your browser menu.<br><br>
    All displayed design value data excludes exceptional events (generally wildfire) 
    as considered by DEC, except when otherwise noted. For example, Fairbanks North Star 
    Borough data includes data without DEC considered exceptional events AND without 
    EPA concurred exceptional events.<br><br>
    For questions or to obtain data beyond what is offered here for download please email 
    [AMQA-Data-Inquiries@alaska.gov](mailto:amqa-data-inquiries@alaska.gov) or visit our 
    [contacts page](https://dec.alaska.gov/air/air-monitoring/contacts/) 
    and reach out to any one of our Sensor Network and Data Acquisition team members.
    "
  )
}

#' get_range
#'
#' @description Get range of given years
#' 
#' @param start_year Year site began collecting pollutant data
#' @param end_year Latest year of collected pollutant data
#'
#' @return A seq() of a given year range
#'
#' @noRd
get_range <- function(start_year, end_year) {
  start_date <- lubridate::parse_date_time(start_year, "y")
  end_date <- lubridate::parse_date_time(end_year, "y")
  range <- sort(
    seq(lubridate::year(start_date), lubridate::year(end_date)),
    decreasing = TRUE
  )
  return(range)
}

#' plot_card
#' 
#' @description Card with avg conc & design value plots
#' 
#' @param plot A reactive avg conc plot
#' @param plot_dv A static design value plot
#' 
#' @return A bslib::card() with accordion and plot outputs
#' 
#' @noRd
plot_card <- function(plot, plot_dv) {
  bslib::accordion(
    # Panel for Avg. Concentration & DV plots
    bslib::accordion_panel(
      "Air Quality Monitoring Data",
      shiny::markdown(
        "***Expand the left sidepanel (>) to filter by year or site.***",
        extensions = TRUE
      ),
      shiny::markdown(
        "*Please wait a few seconds for plots to show.*"
      ),
      plotly::plotlyOutput(plot),
      shiny::markdown(
        "
        
        ---
        
        "
      ),
      plotly::plotlyOutput(plot_dv)
    ),
    # Panel for 'how to use'
    bslib::accordion_panel(
      "How to Use",
      get_howto()
    ),
    # Panel for glossary
    # TODO need to change language - not only for pm25
    bslib::accordion_panel(
      "Glossary",
      get_glossary()
    ),
    # Panel for NAAQS table
    bslib::accordion_panel(
      "NAAQS Table",
      "NAAQS Table HERE"
    ),
    open = "Air Quality Monitoring Data"
  )
}

#' plot_card_pm25
#' 
#' @description Card with avg conc & design value plots - pm2.5 specific
#' 
#' @param plot A reactive avg conc plot
#' @param plot_dv_epa Design value plot with EPA Concurred EEs excluded
#' @param plot_dv_dec Design value plot with DEC Concurred EEs excluded
#' 
#' @return A bslib::card() with accordion and plot outputs - pm2.5 specific
#' 
#' @noRd
plot_card_pm25 <- function(avg_ns, epa_dv_ns, dec_dv_ns) {
  bslib::accordion(
    # Panel for Avg. Concentration & DV plots
    bslib::accordion_panel(
      "Air Quality Monitoring Data",
      shiny::markdown(
        "***Expand the left sidepanel [>] to filter by year or site.***",
        extensions = TRUE
      ),
      shiny::markdown(
        "*Please wait a few seconds for plots to show.*"
      ),
      mod_pm25_avg_ui(avg_ns), 
      shiny::markdown(
        "
        
        ---
        
        "
      ),
      mod_pm25_epa_dv_ui(epa_dv_ns),
      shiny::markdown(
        "
        
        ---
        
        "
      ),
      mod_pm25_dec_dv_ui(dec_dv_ns)
    ),
    # Panel for 'how to use'
    bslib::accordion_panel(
      "How to Use",
      get_howto()
    ),
    # Panel for glossary
    # TODO need to change language - not only for pm25
    bslib::accordion_panel(
      "Glossary",
      get_glossary()
    ),
    # Panel for NAAQS table
    bslib::accordion_panel(
      "NAAQS Table",
      "NAAQS Table HERE"
    ),
    open = "Air Quality Monitoring Data"
  )
}