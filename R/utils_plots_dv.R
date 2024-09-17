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
  xrng <- range(pm25_data$Year)
  naaqs_label <- pm25_data |> dplyr::filter(Year >= 2006)
  max_naaqs_epa <- max(naaqs_label$percentile_EPA_ex)
  max_naaqs_epa <- ifelse(max_naaqs_epa < 35, 40, max_naaqs_epa + 5)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(pm25_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = percentile_EPA_ex,
          color = site_name,
          shape = site_name,
          text = paste(site_name, " 98th Percentile:", percentile_EPA_ex, "µg/m³")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = percentile_EPA_ex, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = dv_24hr_EPA_ex,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "Design Value:", dv_24hr_EPA_ex, "µg/m³")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = dv_24hr_EPA_ex, color = site_name),
        alpha = 0.9
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_excel_new() +
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
          y = max_naaqs_epa, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
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
          y = max_naaqs_epa, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
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
  xrng <- range(pm25_data$Year)
  naaqs_label <- pm25_data |> dplyr::filter(Year >= 2006)
  max_naaqs_dec <- max(naaqs_label$percentile_DEC_ex)
  max_naaqs_dec <- ifelse(max_naaqs_dec < 35, 40, max_naaqs_dec + 5)
  
  return(plotly::ggplotly(
    ggplot2::ggplot(pm25_data, ggplot2::aes(x = Year)) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = percentile_DEC_ex,
          color = site_name,
          shape = site_name,
          text = paste(site_name, " 98th Percentile:", percentile_DEC_ex, "µg/m³")
        ),
        alpha = 0.5,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = percentile_DEC_ex, color = site_name), 
        alpha = 0.5
      ) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          y = dv_24hr_DEC_ex,
          color = site_name,
          shape = site_name,
          text = paste(site_name, "Design Value:", dv_24hr_DEC_ex, "µg/m³")
        ),
        alpha = 0.9,
        size = 2
      ) +
      ggplot2::geom_line(
        ggplot2::aes(y = dv_24hr_DEC_ex, color = site_name),
        alpha = 0.9
      ) +
      ggplot2::guides(color = "none") +
      ggthemes::scale_color_excel_new() +
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
          y = max_naaqs_dec, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
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
          y = max_naaqs_dec, 
          label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)",
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
