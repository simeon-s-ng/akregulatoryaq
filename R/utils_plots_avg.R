#' plot_pm25
#'
#' @description Plots PM2.5 24-hour average concentration
#' 
#' @param pm25_data Cleaned PM2.5 24-hour average concentration dataset
#' @param year Year to plot
#'
#' @return A ggplotly object to be output in a renderPlotly()
#'
#' @noRd
plot_pm25 <- function(pm25_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(pm25_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date,
          y = sample_measurement,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", sample_measurement, "µg/m³")
        ),
        alpha = 0.6
      ) +
      ggplot2::scale_color_brewer(palette = "Dark2", direction = -1) +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "PM2.5 24-hr Average Concentrations", sep = ' '),
        y = "PM2.5 24-hr Average Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y", date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # NAAQS 35ug/m3  limit
      # If year >= 2006, naaqs = 35
      # If year < 2006, naaqs = 65
      {if(year >= 2006) 
        ggplot2::geom_hline(
          ggplot2::aes(yintercept = 35), 
          color = "red", 
          linewidth = 0.2
        )
      } +
      {if(year >= 2006) 
        ggplot2::annotate(
          'text', 
          x = lubridate::date(paste(year, "-06-30", sep = "")),
          y = 40, label = "2006 PM2.5 24-hr NAAQS (35 µg/m³)"
        )
      } +
      {if(year < 2006) 
        ggplot2::geom_hline(
          ggplot2::aes(yintercept = 65),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(year < 2006)
        ggplot2::annotate(
          'text', 
          x = lubridate::date(paste(year, "-06-30", sep = "")),
          y = 70, label = "1997 PM2.5 24-hr NAAQS (35 µg/m³)"
        )
      } +
      ggplot2::theme_minimal() +
      # Visual formatting
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_line(),
        legend.position = "bottom",
        panel.border = ggplot2::element_rect(color = "#4572A7", fill = NA),
        panel.grid.major.x = ggplot2::element_blank()
      ),
    tooltip = c('Date', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h', x = 0.33, y = -0.1)) |> 
    plotly::toWebGL()
}