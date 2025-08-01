#' layout_settings
#'
#' @noRd
layout_settings <- function(plot) {
  plotly::layout(
    p = plot,
    font = list(family = "Open Sans"),
    title = list(font = list(family = "Open Sans")),
    xaxis = list(
      title = list(font = list(family = "Open Sans")),
      tickfont = list(family = "Open Sans")
    ),
    yaxis = list(
      title = list(font = list(family = "Open Sans")),
      tickfont = list(family = "Open Sans")
    ),
    legend = list(
      font = list(family = "Open Sans"),
      orientation = 'h',
      xanchor = "center",
      x = 0.5,
      bordercolor = "#1E4E6E",
      borderwidth = 1,
      tracegroupgap = 2
    )
  )
}

#' legend_settings
#'
#' @noRd
legend_settings <- function() {
  list(
    orientation = 'h',
    xanchor = "center",
    x = 0.5,
    bordercolor = "#1E4E6E",
    borderwidth = 1,
    tracegroupgap = 0,
    traceorder = "grouped"
  )
}

#' plot_config for plotly
#'
#' @noRd
plot_config <- function(p) {
  plotly::config(
    p = p,
    toImageButtonOptions = list(format = "webp")
  )
}

#' plot_theme
#'
#' @noRd
plot_theme <- function() {
  ggplot2::theme(
    axis.title.x = ggplot2::element_blank(),
    axis.ticks.x = ggplot2::element_line(),
    legend.position = "bottom",
    legend.title = ggplot2::element_blank(),
    panel.border = ggplot2::element_rect(color = "#194A6B", fill = NA, linewidth = 1),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.background = ggplot2::element_rect(fill = "#FFFFFF"),
    plot.background = ggplot2::element_rect(fill = "#FFFFFF")
  )
}

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
        value_type == "percentile_EPA_ex", "98th", "DV"
      )
    ) |>
    dplyr::filter(!is.na(value)) |>
    dplyr::mutate(category = paste(site_name, value_type))

  # Get & Set NAAQS reference line years
  xrng <- range(plot_data$Year)
  naaqs_label <- plot_data |>
    dplyr::filter(Year >= 2006, value_type == "98th")
  max_naaqs_epa <- max(naaqs_label$value)
  max_naaqs_epa <- ifelse(max_naaqs_epa < 35, 40, max_naaqs_epa + 5)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "\u00B5g/m\u00B3")
      )
    ) +
      ggplot2::geom_line(ggplot2::aes(group = factor(category)), linewidth = 1) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("dashed", "solid")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM<sub>2.5</sub> 24-hr Design Values & 98<sup>th</sup> Percentiles<br> (EPA Concurred Exceptional Events Excluded)", sep = ' '),
        y = "PM<sub>2.5</sub> 24-hr Concentration (\u00B5g/m\u00B3)",
        color = NULL,
        shape = NULL,
        linetype = NULL,
        # alpha = NULL
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # Scale to 200ug/m3 for Fairbanks
      {if(region == "Fairbanks")
        ggplot2::scale_y_continuous(breaks = seq(0, 200, 20), limits = c(0, 200))
      } +
      # NAAQS 35µg/m³ limit if max(year) >= 2006
      # NAAQS 65µg/m³ limit if max(year < 2006)
      # If range < 2006
      {if(xrng[2] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] < 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 70,
          label = "1997 PM2.5 24-hr NAAQS (65 \u00B5g/m\u00B3)",
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2006, y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::annotate(
          'text',
          x = 2006 - (2006 - xrng[1]) / 2,
          y = 70,
          label = "1997 PM2.5 24-hr NAAQS (65 \u00B5g/m\u00B3)",
          parse = TRUE,
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 40,
          label = "2006 PM2.5 24-hr NAAQS (35 \u00B5g/m\u00B3))",
          alpha = 0.75,
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = 2006, xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - 2006) / 2,
          y = 40,
          label = "2006 PM2.5 24-hr NAAQS (35 \u00B5g/m\u00B3))",
          alpha = 0.75,
          size = 3
        )
      } +
      ggplot2::guides(
        shape = "none",
        linetype = "none",
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme() +
      ggplot2::theme(plot.title = ggplot2::element_text(size = 11)),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
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
        value_type == "percentile_DEC_ex", "98th", "DV"
      )
    ) |>
    dplyr::filter(!is.na(value)) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(plot_data$Year)
  naaqs_label <- plot_data |> dplyr::filter(Year >= 2006, value_type == "98th")
  max_naaqs_dec <- max(naaqs_label$percentile_DEC_ex)
  max_naaqs_dec <- ifelse(max_naaqs_dec < 35, 40, max_naaqs_dec + 5)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "\u00B5g/m\u00B3")
      )
    ) +
      ggplot2::geom_line(ggplot2::aes(group = factor(category)), linewidth = 1) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("dashed", "solid")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM<sub>2.5</sub> 24-hr Design Values & 98<sup>th</sup> Percentiles<br> (DEC Exceptional Events Excluded)", sep = ' '),
        y = "PM<sub>2.5</sub> 24-hr Concentration (\u00B5g/m\u00B3)",
        color = NULL,
        shape = NULL,
        linetype = NULL,
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
      # Scale to 200ug/m3 for Fairbanks
      {if(region == "Fairbanks")
        ggplot2::scale_y_continuous(breaks = seq(0, 200, 20), limits = c(0, 200))
      } +
      # NAAQS 35µg/m³ limit if max(year) >= 2006
      # NAAQS 65µg/m³ limit if max(year < 2006)
      # If range < 2006
      {if(xrng[2] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] < 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 70,
          label = "1997 PM2.5 24-hr NAAQS (65 \u00B5g/m\u00B3)",
          size = 3
        )
      } +
      # SHOW ALL NAAQS LINES
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = 2006, y = 65, yend = 65),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::annotate(
          'text',
          x = 2006 - (2006 - xrng[1]) / 2,
          y = 70,
          label = "1997 PM2.524-hr NAAQS (65 \u00B5g/m\u00B3)",
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = xrng[1], xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] >= 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 40,
          label = "2006 PM2.5 24-hr NAAQS (35 \u00B5g/m\u00B3)",
          alpha = 0.75,
          size = 3
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::geom_segment(
          ggplot2::aes(x = 2006, xend = max(Year), y = 35, yend = 35),
          color = "red",
          linewidth = 0.2,
          inherit.aes = FALSE
        )
      } +
      {if(xrng[2] >= 2006 & xrng[1] < 2006)
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - 2006) / 2,
          y = 40,
          label = "2006 PM2.5 24-hr NAAQS (35 \u00B5g/m\u00B3)",
          alpha = 0.75,
          size = 3
        )
      } +
      ggplot2::guides(
        shape = "none",
        linetype = "none",
      ) +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme() +
      ggplot2::theme(plot.title = ggplot2::element_text(size = 11)),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}

#' plot_pm10_dv
#'
#' @noRd
plot_pm10_dv <- function(pm10_data, region) {
  plot_data <- pm10_data |>
    dplyr::mutate(value_type = dplyr::if_else(value_type == "First Maximum", "1st Max", "2nd Max")) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(pm10_data$Year)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "\u00B5g/m\u00B3")
      )
    ) +
      ggplot2::geom_line(ggplot2::aes(group = factor(category)), linewidth = 1) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("dashed", "solid")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "PM<sub>10</sub> 24-hr Maximum Values", sep = ' '),
        y = "PM<sub>10</sub> 24-hr Concentration (\u00B5g/m\u00B3)",
        color = NULL,
        shape = NULL,
        linetype = NULL
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 260, 20), limits = c(0, 260)) +
      # NAAQS 150µg/m³ limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 150),
        color = "red",
        linewidth = 0.2,
        inherit.aes = FALSE,
      ) +
      {if(region == "Anchorage")
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 4,
          y = 175,
          label = "1987 PM10 24-hr NAAQS (150 \u00B5g/m\u00B3)",
          alpha = 0.75,
          size = 3
        )
      } +
      {if(region != "Anchorage")
        ggplot2::annotate(
          'text',
          x = xrng[2] - (xrng[2] - xrng[1]) / 2,
          y = 175,
          label = "1987 PM10 24-hr NAAQS (150 \u00B5g/m\u00B3)",
          alpha = 0.7,
          size = 3
        )
      } +
      ggplot2::guides(shape = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme(),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}

#' plot_co_dv
#'
#' @noRd
plot_co_dv <- function(co_data, region) {
  plot_data <- co_data |>
    dplyr::mutate(value_type = dplyr::if_else(value_type == "First Maximum", "1st Max", "2nd Max")) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(co_data$Year)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "ppm")
      )
    ) +
      ggplot2::geom_line(
        ggplot2::aes(group = factor(value_type)), linewidth = 1
      ) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("solid", "dashed")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "CO 8-hr Maximum Values", sep = ' '),
        y = "CO 8-hr Concentration (ppm)",
        color = NULL,
        shape = NULL,
        linetype = NULL
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 10, 1), limits = c(0, 10)) +
      # NAAQS 9ppm limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 9),
        color = "red",
        linewidth = 0.2,
        inherit.aes = FALSE
      ) +
      ggplot2::annotate(
        'text',
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 9.5,
        label = "1971 CO 8-hr NAAQS (9 ppm)",
        size = 3
      ) +
      ggplot2::guides(shape = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme(),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}

#' plot_so2_dv
#'
#' @noRd
plot_so2_dv <- function(so2_data, region) {
  plot_data <- so2_data |>
    dplyr::mutate(value_type = dplyr::if_else(value_type == "1-hr Maximum", "1-hr Max", "3-Yr DV")) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(so2_data$Year)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "ppb")
      )
    ) +
      ggplot2::geom_line(
        ggplot2::aes(group = factor(value_type)), linewidth = 1
      ) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("solid", "dashed")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "SO<sub>2</sub> Design Values & Maximums", sep = ' '),
        y = "SO<sub>2</sub> 1-hr Concentrations (ppb)",
        color = NULL,
        shape = NULL,
        linetype = NULL
      ) +
      ggplot2::scale_y_continuous(breaks = seq(0, 80, 20), limits = c(0, 80)) +
      # NAAQS 75ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 75),
        color = "red",
        linewidth = 0.2,
        inherit.aes = FALSE
      ) +
      ggplot2::annotate(
        'text',
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 70,
        label = "2010 SO2 1-hr NAAQS (75 ppb)",
        size = 3
      ) +
      ggplot2::guides(shape = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme(),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}

#' plot_o3_dv
#'
#' @noRd
plot_o3_dv <- function(o3_data, region) {
  plot_data <- o3_data |>
    dplyr::mutate(
      value_type = dplyr::if_else(
        value_type == "3-Year Design Value",
        "3-Yr DV",
        "4th Max"
      )
    ) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(o3_data$Year)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "ppb")
      )
    ) +
      ggplot2::geom_line(
        ggplot2::aes(group = factor(value_type)), linewidth = 1
      ) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("solid", "dashed")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "O<sub>3</sub> 8-hr Design Values & Maximum Values", sep = ' '),
        y = "O<sub>3</sub> 8-hr Concentrations (ppm)",
        color = NULL,
        shape = NULL,
        linetype = NULL
      ) +
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
          linewidth = 0.2,
          inherit.aes = FALSE
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
          linewidth = 0.2,
          inherit.aes = FALSE
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
          linewidth = 0.2,
          inherit.aes = FALSE
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
          linewidth = 0.2,
          inherit.aes = FALSE
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
      ggplot2::guides(shape = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme(),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}

#' plot_no2_dv
#'
#' @noRd
plot_no2_dv <- function(no2_data, region) {
  plot_data <- no2_data |>
    dplyr::mutate(
      value_type = dplyr::if_else(
        value_type == "3-Year Design Value",
        "3-Yr DV",
        "1-hr Max"
      )
    ) |>
    dplyr::mutate(category = paste(site_name, value_type))

  xrng <- range(no2_data$Year)

  return(plotly::ggplotly(
    ggplot2::ggplot(
      plot_data,
      ggplot2::aes(
        x = Year,
        y = value,
        color = category,
        shape = factor(value_type),
        linetype = factor(value_type),
        text = paste(site_name, value_type, ":", value, "ppb")
      )
    ) +
      ggplot2::geom_line(
        ggplot2::aes(group = factor(value_type)), linewidth = 1
      ) +
      ggplot2::geom_point(size = 2.5) +
      ggplot2::scale_color_manual(values = dv_palette_16()) +
      ggplot2::scale_linetype_manual(values = c("solid", "dashed")) +
      # Axis settings
      ggplot2::labs(
        title = paste(region, "NO<sub>2</sub> Design Values & Maximums", sep = ' '),
        y = "NO<sub>2</sub> 1-hr Concentrations (ppb)",
        color = NULL,
        shape = NULL,
        linetype = NULL
      ) +
      ggplot2::scale_x_continuous(breaks = function(x) unique(floor(pretty(x)))) +
      ggplot2::scale_y_continuous(breaks = seq(0, 120, 20), limits = c(0, 120)) +
      # NAAQS 100ppb limit
      ggplot2::geom_hline(
        ggplot2::aes(yintercept = 100),
        color = "red",
        linewidth = 0.2,
        inherit.aes = FALSE
      ) +
      ggplot2::annotate(
        'text',
        x = xrng[2] - (xrng[2] - xrng[1]) / 2,
        y = 105,
        label = "2010 NO2 1-hr NAAQS (100 ppb)",
        size = 3
      ) +
      ggplot2::guides(shape = "none", linetype = "none") +
      ggplot2::theme_minimal() +
      # Visual formatting
      plot_theme(),
    tooltip = c('Year', 'text')
  ) |>
    layout_settings() |>
    plotly::toWebGL()
  )
}
