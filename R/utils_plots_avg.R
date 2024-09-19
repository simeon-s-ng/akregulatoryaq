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
      ggthemes::scale_color_colorblind() +
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
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
}

#' plot_pm10
#' 
#' @description Plots PM10 24-hour average concentration
#' 
#' @param pm10_data Cleaned PM10 24-hour average concentration dataset
#' @param year Year to plot
#' 
#' @return A ggplotly object to be output in a renderPlotly()
#' 
#' @noRd
plot_pm10 <- function(pm10_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(pm10_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date,
          y = sample_measurement,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", sample_measurement, "µg/m³")
        ),
        alpha = 0.5
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "PM10 24-hr Average Concentrations", sep = ' '),
        y = "1987 PM10 24-hr Average Concentration (µg/m³)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y", 
        date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 200, 20), limits = c(0, 200)) +
      # NAAQS 150ug/m3  limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 150),
        color = "red",
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = lubridate::date(paste(year, "-06-30", sep = "")), 
        y = 140,
        label = "24-hr PM10 NAAQS (150 µg/m³)"
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
    tooltip = c('Date', 'text')
  ) |>
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
}

#' plot_co
#' 
#' @description Plots CO 8-hour average concentrations
#' 
#' @return A ggplotly object to be output in a renderPlotly()
#' 
#' @noRd
plot_co <- function(co_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(co_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date,
          y = avg_8hr,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", avg_8hr, "ppm")
        ),
        alpha = 0.5) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "CO 8-hr Average Concentrations", sep = ' '),
        y = "CO 8-hr Concentration (ppm)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y",
        date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
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
        x = lubridate::date(paste(year, "-06-30", sep = "")), 
        y = 9.5, 
        label = "1971 8-hr NAAQS (9 ppm)"
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
    tooltip = c('Date', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
}

#' plot_so2
#' 
#' @noRd
plot_so2 <- function(so2_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(so2_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date,
          y = max_1hr,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", max_1hr, "ppb")
        ),
        alpha = 0.5
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "SO2 1-hr Maximum Concentrations", sep = ' '),
        y = "SO2 1-hr Max Concentration (ppb)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y", 
        date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 80, 20), limits = c(0, 80)) +
      # NAAQS 100ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 75), 
        color = "red", 
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = lubridate::date(paste(year, "-06-30", sep = "")),
        y = 65,
        label = "2010 SO2 1-hr NAAQS (75 ppb)"
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
    tooltip = c('Date', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
}

#' plot_o3
#' 
#' @noRd
plot_o3 <- function(o3_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(o3_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date, 
          y = avg_8hr,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", avg_8hr, "ppm")
        ),
        alpha = 0.5
      ) +
     ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "O3 8-hr Average Concentrations", sep = ' '),
        y = "O3 8-hr Concentration (ppm)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y", 
        date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 0.1, 0.01), limits = c(0, 0.1)) +
      # NAAQS 0.070ppm limit
      {if(year >= 2015) 
        ggplot2::geom_hline(
          ggplot2::aes(yintercept = 0.070),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(year >= 2015) 
        ggplot2::annotate(
          'text', 
          x = lubridate::date(paste(year, "-06-30", sep = "")),
          y = 0.08,
          label = "2015 O3 8-hr NAAQS (0.070 ppm)"
        )
      } +
      {if(year < 2015) 
        ggplot2::geom_hline(
          ggplot2::aes(yintercept = 0.075),
          color = "red",
          linewidth = 0.2
        )
      } +
      {if(year < 2015) 
        ggplot2::annotate(
          'text', 
          x = lubridate::date(paste(year, "-06-30", sep = "")),
          y = 0.085,
          label = "2008 O3 8-hr NAAQS (0.075 ppm)"
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
    tooltip = c('Date', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h')) |> 
    plotly::toWebGL()
}

#' plot_no2
#' 
#' @noRd
plot_no2 <- function(no2_data, year) {
  plotly::ggplotly(
    ggplot2::ggplot(no2_data) +
      ggplot2::geom_point(
        mapping = ggplot2::aes(
          x = Date,
          y = max_1hr,
          color = site_name,
          shape = site_name,
          text = paste(year, site_name, "Data Point:", max_1hr, "ppb")
        ),
        alpha = 0.5
      ) +
      ggthemes::scale_color_colorblind() +
      # Axis settings
      ggplot2::labs(
        title = paste(year, "NO2 1-hr Maximum Concentrations", sep = ' '),
        y = "NO2 1-hr Max Concentration (ppb)",
        color = "Site Name",
        shape = "Site Name"
      ) +
      ggplot2::scale_x_date(
        date_labels = "%b '%y", 
        date_breaks = "1 month",
        limits = c(
          lubridate::as_date(paste(year, "-01-01", sep="")),
          lubridate::as_date(paste(year, "-12-31", sep=""))
        )
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 120, 20), limits = c(0, 120)) +
      # NAAQS 100ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 100),
        color = "red",
        linewidth = 0.2
      ) +
      ggplot2::annotate(
        'text', 
        x = lubridate::date(paste(year, "-06-30", sep = "")), 
        y = 110, 
        label = "2010 NO2 1-hr NAAQS (100 ppb)"
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
    tooltip = c('Date', 'text')
  ) |> 
    plotly::layout(legend = list(orientation = 'h'))|> 
    plotly::toWebGL()
}

