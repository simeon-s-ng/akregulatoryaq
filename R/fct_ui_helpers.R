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

#' Manual Avg Color Palette
#'
#' @description
#' Color palette for avg plots.
#'
#'
#' @return Color Palette for avg plots
#' @export
avg_palette <- function() {
  c(
    "#233b64",
    "#5bef8f",
    "#db11ac",
    "#08a9e5",
    "#82185f",
    "#c0e087",
    "#6a45c2"
  )
}

#' Manual DV Color Palette
#'
#' @description
#' Color palette for DV plots.
#'
#'
#' @return Color Palette for DV plots
#' @export
dv_palette <- function() {
  c(
    "#000000",
    "#eebe08",
    "#233b64",
    "#52e9e6",
    "#0b522e",
    "#09c553",
    "#99d683",
    "#169294",
    "#b3d9fa",
    "#3e2690",
    "#8489e0",
    "#b144d6"
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
    "
    **24-hour Design Value (DV)**<br>
    A three-year average of the 98th percentile value. An area is in
    violation of the NAAQS when the Design Values is greater than the
    24-hour NAAQS for PM2.5, which is currently set at 35 \u00B5g/m\u00B3.
    <a href='https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf' target='_blank'>40 CFR 50 Appendix N - see section 4.5(b) (PDF)</a><br>
    <br>
    **98th Percentile**<br>
    The daily value out of a year of PM2.5 monitoring data below which 98
    percent of all daily values fall.
    <a href='https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf' target='_blank'>40 CFR 50 Appendix N - see section 4.5(a) (PDF)</a><br>
    <br>
    **Clean Data Year**<br>
    A year when the 98th percentile value is less than the NAAQS.<br>
    <br>
    **Compliance with PM2.5 NAAQS**<br>
    *24-Hour* - 98th percentile, averaged over 3 years, must be below the
    standard.<br>
    *Annual* - Annual arithmetic mean, averaged over 3 years,
    must be below the standard.
    <a href='https://dec.alaska.gov/media/7666/40-cfr-50-appx-n.pdf' target='_blank'>40 CFR 50 Appendix N - see sections 4.1 and 4.2 (PDF)</a><br>
    <br>
    **Concentration, \u00B5g/m\u00B3**<br>
    The amount of pollutants in the air at a specific location.<br>
    <br>
    **Exceedance**<br>
    A condition that is detected by monitoring that provides data in terms of an emission limitation or standard and that indicates that emissions (or opacity) are greater than the applicable emission limitation or standard (or less than the applicable standard in the case of a percent reduction requirement) consistent with any averaging period specified for averaging the results of the monitoring.<br>
    <br>
    **Exceptional Events**<br>
    Unusual or naturally occurring events that can affect air quality
    but are not reasonably controllable.<br>
    <a href='https://www.epa.gov/air-quality-analysis/treatment-air-quality-monitoring-data-influenced-exceptional-events/' target='_blank'>EPA's Exceptional Events Webpage</a><br>
    <a href='https://dec.alaska.gov/air/air-monitoring/guidance/exceptional-events/' target='_blank'>DEC's Exceptional Events Webpage</a><br>
    <br>
    **NAAQS**<br>
    National Ambient Air Quality Standard - A health-based air quality
    standard set by EPA based on a review of available scientific information.
    NAAQS exist for criteria pollutants including Particulate Matter
    (PM2.5 and PM10), Carbon Monoxide (CO), Sulfur Dioxide (SO2),
    Nitrogen Dioxide (NO2), Ozone (O3), and Lead (Pb).<br>
    <a href='https://www.epa.gov/naaqs' target='_blank'>EPA's NAAQS Webpage</a>
    "
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
    or download data click the left-hand menu [**>**] icon.
    To collapse this menu and view the data figure as a larger figure click [**<**].
    - Site selection defaults to all sites in the region. To unselect or select sites,
    click the site(s) in the site dropdown.
    - Additional site information, can be found in the 'Site Information' box below the site selection dropdown.
    Click on the site name link to be redirected to the monitoring site's webpage for further information.
    - To download data (2000 and after), select the site and year from the Filters section; You are limited to downloading one pollutant and one year at a time for the selected sites. To view data of various pollutants (PM2.5, PM10, CO, SO2, O3, or NO2)
    select a pollutant above the data graph.

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
    'Download plot as png' when hovered over.
    - Zoom in on a selection of the figure by clicking on the magnifying glass with a square
    in the middle that says 'Zoom' when hovered over.
    - Moving around within the figure by clicking on the icon with arrows pointing
    in the four cardinal directions that says 'Pan' when hovered over.
    - Highlighting a rectangular portion of the figure by clicking on the icon
    with a rectangle with dashed lines that says 'Box Select' when hovered over.
    - Highlighting a freeform portion of the figure by clicking on the lasso
    icon that says 'Lasso Select' when hovered over.
    - Zoom in by clicking the square icon with a **+** sign in it that says 'Zoom in' when hovered over.
    - Zoom out by clicking the square icon with a **-** sign in it that says 'Zoom out' when hovered over.
    - To scale the axes of the figure to match the data click the icon with four arrows pointing out towards corners
    that says 'Autoscale' when hovered over.
    - To reset the scale of the figure, click the house icon that says 'Reset axes' when hovered over.
    - To review a single data point, click the single flat arrow pointing left icon that says 'Show closest data on hover' when hovered over.
    - To compare multiple data points, click the two stacked flat arrows pointing left icon that says 'Compare data on hover' when hovered over.

    <!-- end of the list -->

    For more details expand the Glossary by clicking the **Glossary dropdown [\u2228]** below the data figure.
    To see the National Ambient Air Quality Standards (NAAQS) set forth by EPA
    expand the NAAQS Table by clicking the **NAAQS Table dropdown [\u2228]** below the data figure.<br><br>
    All displayed design value data excludes exceptional events (generally wildfire)
    as considered by DEC, except when otherwise noted. For example, Fairbanks North Star
    Borough data includes data without DEC considered exceptional events AND without
    EPA concurred exceptional events.<br><br>
    For questions or to obtain data beyond what is offered here for download please email
    <a href='mailto:amqa-data-inquiries@alaska.gov' target='_blank'>AMQA-Data-Inquiries@alaska.gov<a/> or visit our
    <a href='https://dec.alaska.gov/air/air-monitoring/contacts/' target='_blank'>contacts page</a>
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

#' naaqs_table
#'
#' @description Table with PM2.5 NAAQS values.
#'
#' @return A gt table
#'
#' @noRd
naaqs_table <- function() {
  naaqs_table <- naaqs_data |>
    gt::gt(rowname_col = "Standard") |>
    gt::tab_stubhead(label = "Standard") |>
    gt::tab_style(
      style = list(
        gt::cell_text(color = "#ffffff"),
        gt::cell_fill(color = "#072f49"),
        gt::cell_borders(color = "#F7F5F2")
      ),
      locations = list(
        gt::cells_stub(),
        gt::cells_stubhead(),
        gt::cells_column_labels(columns = everything())
      )
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_borders(color = "#072f49"),
        gt::cell_fill(color = "#F7F5F2")
      ),
      locations = gt::cells_body(columns = everything())
    ) |>
    gt::tab_options(
      table.width = "100%",
      table.layout = "auto"
    )
  return(naaqs_table)
}

#' plot_card
#'
#' @description Card with avg conc & design value plots
#'
#' @param avg_mod A reactive avg conc module
#' @param dv_mod A static design value module
#'
#' @return A bslib::card() with accordion and plot outputs
#'
#' @noRd
plot_card <- function(avg_mod, dv_mod, table_mod) {
  bslib::accordion(
    # Panel for 'how to use'
    bslib::accordion_panel(
      "How to Use",
      get_howto()
    ),
    # Panel for Avg. Concentration & DV plots
    bslib::accordion_panel(
      "Air Quality Monitoring Data",
      height = "75%",
      shiny::markdown(
        "**Expand the left sidepanel [>] to filter by year or site.** Please wait a few seconds for plots to show.<br>Dashboard will time out after 15 minutes to prevent excessive load on the server. To reload, refresh your browser menu.",
        extensions = TRUE
      ),
      avg_mod,
      shiny::markdown(
        "

        ---

        "
      ),
      dv_mod
    ),
    # Panel for glossary
    # TODO need to change language - not only for pm25
    bslib::accordion_panel(
      "Glossary",
      get_glossary()
    ),
    # Panel for NAAQS table
    bslib::accordion_panel(
      "NAAQS Table for PM2.5",
      table_mod
    ),
    open = "Air Quality Monitoring Data",
    multiple = TRUE
  )
}

#' plot_card_pm25
#'
#' @description Card with avg conc & design value plots - pm2.5 specific
#'
#' @param avg_ns A reactive avg conc module
#' @param epa_dv_ns Design value module with EPA Concurred EEs excluded
#' @param dec_dv_ns Design value module with DEC Concurred EEs excluded
#'
#' @return A bslib::card() with accordion and plot outputs - pm2.5 specific
#'
#' @noRd
plot_card_pm25 <- function(avg_ns, epa_dv_ns, dec_dv_ns, table_ns) {
  bslib::accordion(
    # Panel for 'how to use'
    bslib::accordion_panel(
      "How to Use",
      get_howto()
    ),
    # Panel for Avg. Concentration & DV plots
    bslib::accordion_panel(
      "Air Quality Monitoring Data",
      height = "75%",
      shiny::markdown(
        "**Expand the left sidepanel [>] to filter by year or site.** Please wait a few seconds for plots to show.<br>Dashboard will time out after 15 minutes to prevent excessive load on the server. To reload, refresh your browser menu.",
        extensions = TRUE
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
    # Panel for glossary
    # TODO need to change language - not only for pm25
    bslib::accordion_panel(
      "Glossary",
      get_glossary()
    ),
    # Panel for NAAQS table
    bslib::accordion_panel(
      "NAAQS Table for PM2.5",
      mod_naaqs_table_ui(table_ns)
    ),
    open = "Air Quality Monitoring Data",
    multiple = TRUE
  )
}
