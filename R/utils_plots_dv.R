#' plot_pm25_epa_dv
#'
#' @description Plot of PM2.5 EPA EEs Excluded DVs
#'
#' @param pm25_data Design value data from user input
#' @param region Region name
#' 
#' @return A ggplotly object to be output in a renderPlotly()
#'
#' @noRd
plot_pm25_epa_dv <- function(pm25_data, region) {
  plot_data <- pm25_data |> 
    dplyr::filter(value_type == "percentile_EPA_ex" | value_type == "dv_24hr_EPA_ex") |> 
    dplyr::mutate(
      value_type = ifelse(
        value_type == "percentile_EPA_ex", "98th Percentile", "Design Value"
      )
    )

  xrng <- range(plot_data$Year)
  naaqs_label <- plot_data |> 
    dplyr::filter(Year >= 2006, value_type == "98th Percentile")
  max_naaqs_epa <- max(naaqs_label$value)
  max_naaqs_epa <- ifelse(max_naaqs_epa < 35, 40, max_naaqs_epa + 5)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data, 
      ggplot2::aes(
        x = Year, 
        y = value, 
        group = value_type, 
        color = site_name, 
        shape = site_name,
        text = paste(site_name, value_type, ":", value, "µg/m³")
      )
    ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45, 
        size = 2
      ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9, 
        size = 2
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM2.5 24-hr Design Values (EPA Concurred Exceptional Events Excluded)", sep = ' '),
        y = "PM2.5 24-hr Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # NAAQS 35µg/m³ limit if max(year) >= 2006
      # NAAQS 65µg/m³ limit if max(year < 2006)
      # If range < 2006
      {if(xrng[2] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 65, yend = 65),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2006, y = 65, yend = 65),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = 2006 - (2006 - xrng[1]) / 2, 
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 40, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          alpha = 0.7,
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = 2006, xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - 2006) / 2,
          y = 40, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          alpha = 0.7,
          size = 3
        )
      } +
      ggplot2::guides(color = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()),
    tooltip = c('Year', 'text'),
    dynamicTicks = TRUE
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_pm25_dec_dv
#' 
#' @description Plot of PM2.5 DEC EEs Excluded DVs
#' @param pm25_data Design value data from user input
#' @param region Region name
#' 
#' @noRd
plot_pm25_dec_dv <- function(pm25_data, region) {
  plot_data <- pm25_data |> 
    dplyr::filter(value_type == "percentile_DEC_ex" | value_type == "dv_24hr_DEC_ex") |> 
    dplyr::mutate(
      value_type = ifelse(
        value_type == "percentile_DEC_ex", "98th Percentile", "Design Value"
      )
    )

  xrng <- range(plot_data$Year)
  naaqs_label <- plot_data |> dplyr::filter(Year >= 2006)
  max_naaqs_dec <- max(naaqs_label$percentile_DEC_ex)
  max_naaqs_dec <- ifelse(max_naaqs_dec < 35, 40, max_naaqs_dec + 5)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data, 
      ggplot2::aes(
        x = Year,
        y = value,
        group = value_type,
        color = site_name,
        shape = site_name,
        text = paste(site_name, value_type, ":", value, "µg/m³")
      )
    ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45, 
        size = 2
      ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9, 
        size = 2
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM2.5 24-hr Design Values (DEC Exceptional Events Excluded)", sep = ' '),
        y = "PM2.5 24-hr Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # NAAQS 35µg/m³ limit if max(year) >= 2006
      # NAAQS 65µg/m³ limit if max(year < 2006)
      # If range < 2006
      {if(xrng[2] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 65, yend = 65),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2006, y = 65, yend = 65),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = 2006 - (2006 - xrng[1]) / 2,
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 40, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          alpha = 0.7,
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = 2006, xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - 2006) / 2,
          y = 40, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          alpha = 0.7,
          size = 3
        )
      } +
      ggplot2::guides(color = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_pm10_dv
#' 
#' @noRd
plot_pm10_dv <- function(pm10_data, region) {
  xrng <- range(pm10_data$Year)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(pm10_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = first_max,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "1st Max:", first_max, "µg/m³")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = first_max, color = site_name), 
        alpha = 0.9
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = second_max,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "2nd Max:", second_max, "µg/m³")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = second_max, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM10 24-hr Maximum Values", sep = ' '),
        y = "PM10 24-hr Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 350, 50), limits = c(0, 350)) +
      # NAAQS 150µg/m³ limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 150), 
        color = "red", 
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 300,
        label = "1987 PM2.5 24-hr NAAQS (150 µg/m³)",
        size = 3
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_co_dv
#' 
#' @noRd
plot_co_dv <- function(co_data, region) {
  xrng <- range(co_data$Year)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(co_data, ggplot2::aes(x = Year, )) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = max_8hr,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "1st Maximum:", max_8hr, "ppm")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = max_8hr, color = site_name),
        alpha = 0.9
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = max_8hr_2,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "2nd Maximum:", max_8hr_2, "ppm")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = max_8hr_2, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "CO 8-hr Maximum Values", sep = ' '),
        y = "CO 8-hr Concentration (ppm)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 10, 1), limits = c(0, 10)) +
      # NAAQS 9ppm limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 9),
        color = "red",
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 9.5,
        label = "1971 CO 8-hr NAAQS (9 ppm)",
        size = 3
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()
      ),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_so2_dv
#' 
#' @noRd
plot_so2_dv <- function(so2_data, region) {
  xrng <- range(so2_data$Year)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(so2_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = dv_3yr,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "3-Year Design Value:", dv_3yr, "ppb")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = dv_3yr, color = site_name), 
        alpha = 0.9
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = max_1hr,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "Maximum Value:", max_1hr, "ppb")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = max_1hr, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "SO2 Design Values", sep = ' '),
        y = "SO2 1-hr Concentrations (ppb)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 80, 20), limits = c(0, 80)) +
      # NAAQS 75ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 75),
        color = "red",
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 70,
        label = "2010 SO2 1-hr NAAQS (75 ppb)",
        size = 3
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()
      ),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_o3_dv
#' 
#' @noRd
plot_o3_dv <- function(o3_data, region) {
  xrng <- range(o3_data$Year)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(o3_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = max_8hr,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "Maximum Value:", max_8hr, "ppb")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = max_8hr, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = dv_3yr,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "3-Year Design Value:", dv_3yr, "ppb")
        ),
        alpha = 0.9,
        size = 2) +
      ggplot2::geom_line(ggplot2::aes(y = dv_3yr, color = site_name), alpha = 0.9) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "O3 8-hr Maximum Values", sep = ' '),
        y = "O3 8-hr Concentrations (ppm)",
        color = "Site Name",
        shape = "Site Name") +
      ggplot2::scale_y_continuous(breaks = seq(0, 0.1, 0.01), limits = c(0, 0.1)) +
      # NAAQS 9ppm limit
      # Annotate if max(years) < 2015
      # Annotate if max(years) >= 2015
      # ONLY SHOW 2008 NAAQS LINE
      {if(xrng[2] < 2015) 
        ggplot2::geom_segment(
          ggplot2::aes(
            x = 2008, 
            xend = max(Year), 
            y = 0.075, 
            yend = 0.075
          ),
          color = "red", 
          linewidth = 0.2
        )
      } +
      {if(xrng[2] < 2015) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - 2008) / 2, 
          y = 0.08, 
          label = "2008 O3 8-hr NAAQS (0.075 ppm)", 
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2015 & xrng[1] < 2015) 
        ggplot2::geom_segment(
          ggplot2::aes(x = 2015, xend = max(Year), y = 0.07, yend = 0.07),
          color = "red", 
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2015 & xrng[1] < 2015)
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - 2015) / 2, 
          y = 0.075,
          label = "2015 O3 8-hr NAAQS (0.070 ppm)", 
          size = 3
        )
      } +
      {if(xrng[2] >= 2015 & xrng[1] < 2015) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2015, y = 0.075, yend = 0.075),
          color = "red", 
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2015 & xrng[1] < 2015) 
        ggplot2::annotate(
          'text', 
          x = 2015 - (2015 - xrng[1]) / 2, 
          y = 0.08,
          label = "2008 O3 8-hr NAAQS (0.075 ppm)", 
          size = 3
        )
      } +
      {if(xrng[2] >= 2015 & xrng[1] >= 2015) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 0.07, yend = 0.07),
          color = "red", 
          linewidth = 0.2
        )
      } +
      {if(xrng[2] >= 2015 & xrng[1] >= 2015) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2, 
          y = 0.075,
          label = "2015 O3 8-hr NAAQS (0.070 ppm)", 
          size = 3
        )
      } +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_no2_dv
#' 
#' @noRd
plot_no2_dv <- function(no2_data, region) {
  xrng <- range(no2_data$Year)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(no2_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = dv_3yr, 
          color = site_name,
          shape = site_name,
          text = paste(site_name, "3-Year Design Value:", dv_3yr, "ppb")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = dv_3yr, color = site_name), 
        alpha = 0.9
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = max_1hr, 
          color = site_name,
          shape = site_name,
          text = paste(site_name, "1-Hour Maximum Value:",max_1hr, "ppb")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = max_1hr, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "NO2 Design Values", sep = ' '),
        y = "NO2 1-hr Concentrations (ppb)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +  
      ggplot2::scale_y_continuous(breaks = seq(0, 120, 20), limits = c(0, 120)) +
      # NAAQS 100ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 100),
        color = "red",
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 105,
        label = "2010 NO2 1-hr NAAQS (100 ppb)",
        size = 3
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()
      ),
    tooltip = c('Year', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}

#' plot_dv_test
#'
#' @description Plot of PM2.5 EPA EEs Excluded DVs
#'
#' @param pm25_data Design value data from user input
#' @param region Region name
#' 
#' @return A ggplotly object to be output in a renderPlotly()
#'
#' @noRd
plot_dv_test <- function(pm25_data, region) {
  plot_data <- pm25_data |> 
    dplyr::filter(value_type == "percentile_EPA_ex" | value_type == "dv_24hr_EPA_ex") |> 
    dplyr::mutate(
      value_type = ifelse(
        value_type == "percentile_EPA_ex", "98th Percentile", "Design Value"
      )
    )

  xrng <- range(plot_data$Year)
  naaqs_label <- plot_data |> 
    dplyr::filter(Year >= 2006, value_type == "98th Percentile")
  max_naaqs_epa <- max(naaqs_label$value)
  max_naaqs_epa <- ifelse(max_naaqs_epa < 35, 40, max_naaqs_epa + 5)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data, 
      ggplot2::aes(
        x = Year, 
        y = value, 
        group = value_type, 
        color = site_name, 
        shape = site_name,
        text = paste(site_name, value_type, ":", value, "µg/m³")
      )
    ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "98th Percentile"),
        alpha = 0.45, 
        size = 2
      ) +
      ggplot2::geom_line(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9
      ) + 
      ggplot2::geom_point(
        data = subset(plot_data, value_type == "Design Value"),
        alpha = 0.9, 
        size = 2
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM2.5 24-hr Design Values (EPA Concurred Exceptional Events Excluded)", sep = ' '),
        y = "PM2.5 24-hr Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # NAAQS 35µg/m³ limit if max(year) >= 2006
      # NAAQS 65µg/m³ limit if max(year < 2006)
      # If range < 2006
      {if(xrng[2] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          show.legend = FALSE
        )
      } +
      {if(xrng[2] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2006, y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          show.legend = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = 2006 - (2006 - xrng[1]) / 2, 
          y = 70, 
          label = "1997 PM2.5 24-hr NAAQS (65 µg/m³)",
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          show.legend = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = max_naaqs_epa, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::geom_segment(
          ggplot2::aes(x = 2006, xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          show.legend = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006) 
        ggplot2::annotate(
          'text', 
          x = xrng[2] - (xrng[2] - 2006) / 2,
          y = max_naaqs_epa, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
          size = 3
        )
      } +
      ggplot2::guides(color = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        legend.title = ggplot2::element_blank(),
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()),
    tooltip = c('Year', 'text'),
    dynamicTicks = TRUE
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
  )
}
