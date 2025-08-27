# regulatory_data_raw.R
# Cleaning regulatory data for Shiny App
# Updated 7/23/25

library(tidyverse)
library(zoo)
library(usethis)

## Global Paths ----
input_path    <- "//decan-srvfile/decan-srvfile/Groups/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/input"
input_path_dv <- "//decan-srvfile/decan-srvfile/Groups/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/24-hour design value"
input_clean   <- "//decan-srvfile/decan-srvfile/Groups/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/input_clean"

# NEW Global Input Path ----
input_data_raw <- "//decan-srvfile/decan-srvfile/Groups/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/data-raw/"

## NAAQS Calculation Functions -------------------------------------------------

## CO --------------------------------------------------------------------------

# mean_valid_CO_8hr()
# Returns mean of a valid CO dataset.
mean_valid_CO_8hr <- function(data) {
  if(sum(is.na(data)) > length(data) * 0.25) {
    return(NA)
  }
  else {
    mean(data, na.rm = TRUE)
  }
}

# Daily Maximum 8-hr avg conc.
# Valid 8-hr avg is one with at least 75% of the hourly data available
# -- If there are only 6 or 7 hourly averages, divide by 6 or 7
# -- Don't ignore 8-hr periods with less than 6 hrs
# -- -- Substitute 1/2 the minimum detectable limit for missing hourly concentrations.
# -- -- After the substitution, if the 8-hr avg is greater than the level of the standard
# -- -- keep the 8-hr avg.
# The 8-hr avg is reported to three decimal places, and insignificant digits to
# the right of the third decimal place are truncated.

calc_co_8hr_avg <- function(data, site) {
  co_data <- select(data, date_local, time_local, sample_measurement) |>
    mutate(
      date_local = parse_date_time(
        paste(date_local, time_local),
        "Ymd HMS"
      )
    ) |>
    # Arrange by datetime
    arrange(date_local) |>
    mutate(date_local = date(date_local)) |>
    # Calc rolling avg
    mutate(
      rolling_avg_8hr = round(
        rollapply(
          sample_measurement,
          8,
          FUN = mean_valid_CO_8hr,
          align = "left",
          fill = NA
        ),
        digits = 1
      )
    ) |>
    dplyr::group_by(date_local) |>
    summarise(avg_8hr = max(rolling_avg_8hr)) |>
    mutate(site_name = site) |>
    rename(Date = date_local)

  return(co_data)
}

## NO2 -------------------------------------------------------------------------

calc_no2_1hr_max <- function(data, site) {
  no2_data <- select(data, date_local, time_local, sample_measurement) |>
    mutate(
      date_local = parse_date_time(
        paste(date_local, time_local),
        "Ymd HMS"
      )
    ) |>
    arrange(date_local) |>
    mutate(date_local = date(date_local)) |>
    group_by(date_local) |>
    summarise(max_1hr = max(sample_measurement, na.rm = TRUE)) |>
    mutate(max_1hr = if_else(max_1hr == "-Inf", NA, as.numeric(max_1hr))) |>
    mutate(site_name = site) |>
    rename(Date = date_local)

  return(no2_data)
}

## O3 --------------------------------------------------------------------------

mean_valid_O3_8hr <- function(data) {
  if(sum(is.na(data)) > length(data) * 0.25) {
    calc_sub_8_hr <- data |>
      replace_na(0.0025) |> # substitute minimum detectable limit of sensor for missing values
      mean()
    if(calc_sub_8_hr > 0.070) { # use value if greater than the NAAQS
      return(calc_sub_8_hr)
    }
    else {
      return(NA)
    }
  }
  else {
    mean(data, na.rm = TRUE)
  }
}

# valid day if 75% of 8-hour averages are available in 24-hours
# If less than 75% are available, a day shall be counted if the maximum for that day is greater than the standard
daily_valid <- function(data) {
  if(sum(is.na(data)) > length(data) * 0.25) {
    if(is.na(max(data))) {
      return(NA)
    }
    if(max(data, na.rm = FALSE) > 0.070) { # use value if greater than the NAAQS
      return(max(data, na.rm = FALSE))
    }
    else {
      return(NA)
    }
  }
  else {
    return(max(data, na.rm = TRUE))
  }
}

# calc_o3_8hr_avg
# Ozone 8-hour averages.
# 8-hr average is considered valid if at least 75% of the hourly averages for the
# 8-hour period are available. If 6/7, then use 6/7 hours as the divisor.
# 8-hour periods with >= 3 hours of missing hours are ignored if after substituting
# one-half of the minimum detectable limit for the missing hourly concentrations (0.005 ppm),
# the 8-hour average concentration is greater than the level of the standard (0.070 ppm).
# There are 24 possible 8-hour average concs per day. The daily max 8-hour is the highest of the 24.
# A monitoring day shall be counted as valid day if 8-hour averages are available for 75% of the possible
# hours in the day. If less than 75% are available, the day shall be counted if the max conc is greater
# than the NAAQS
calc_o3_8hr_avg <- function(data, site) {
  o3_data <- select(
      data,
      date_local,
      time_local,
      sample_measurement,
      detection_limit
    ) |>
    mutate(
      date_local = parse_date_time(
        paste(date_local, time_local),
        "Ymd HMS"
      )
    ) |>
    # Arrange by datetime
    arrange(date_local) |>
    # Fill missing hours
    complete(date_local = seq(min(date_local), max(date_local), 'hour')) |>
    mutate(date_local = date(date_local)) |>
    # Calculate rolling average
    mutate(
      rolling_avg_8hr = trunc(
        rollapply(
          sample_measurement,
          8,
          FUN = mean_valid_O3_8hr,
          align = "left",
          fill = NA
        ) * 1000
      ) / 1000
    ) |>
    # Check for valid hours in a day
    mutate(
      daily_8hr = trunc(
        rollapply(
          rolling_avg_8hr, width = 24, by = 24, FUN = daily_valid, align = "left", fill = NA
        ) * 1000
      ) / 1000
    ) |>
    filter(time_local == hms("00:00:00")) |>
    group_by(date_local) |>
    summarise(avg_8hr = max(daily_8hr)) |>
    mutate(site_name = site) |>
    rename(Date = date_local)

  return(o3_data)
}

## SO2 -------------------------------------------------------------------------

calc_so2_1hr_max <- function(data, site) {
  so2_data <- filter(data, sample_duration == "1 HOUR") |>
    select(date_local, time_local, sample_measurement) |>
    mutate(
      date_local = parse_date_time(
        paste(date_local, time_local),
        "Ymd HMS"
      )
    ) |>
    arrange(date_local) |>
    mutate(date_local = date(date_local)) |>
    group_by(date_local) |>
    summarise(max_1hr = max(sample_measurement, na.rm = TRUE)) |>
    mutate(max_1hr = if_else(max_1hr == "-Inf", NA, as.numeric(max_1hr))) |>
    mutate(site_name = site) |>
    rename(Date = date_local)

  return(so2_data)
}

## Import Functions ------------------------------------------------------------

# import_files
import_files <- function(file_ex) {
  files <- fs::dir_ls(path = input_path, glob = file_ex)
  import <- read_csv(files, id = "path")
  return(import)
}

# import_pm
import_pm <- function(file_ex) {
  files <- fs::dir_ls(path = input_clean, glob = file_ex)
  import <- read_csv(files, id = "path")
  return(import)
}

# import_data_raw
import_data_raw <- function(file_ex) {
  files <- fs::dir_ls(path = input_data_raw, glob = file_ex)
  import <- read_csv(files, id = "path")
  return(import)
}

## Import PM25 and PM10 --------------------------------------------------------

pm25_ex <- "*PM25_final*csv"
pm25_import <- import_pm(pm25_ex) |>
  rename(site_id = site_number)

pm10_ex <- "*PM10_final*csv"
pm10_import <- import_pm(pm10_ex) |>
  rename(site_id = site_number)

pm_sites_ex <- "*sites*csv"
pm_sites <- import_pm(pm_sites_ex) |>
  mutate(site_id = as.numeric(site_id)) |>
  select(site_id, site_name) |>
  distinct()

pm25_import_named <- left_join(pm25_import, pm_sites, by = "site_id") |>
  select(date_local, sample_measurement, site_name) |>
  rename(Date = date_local) |>
  mutate(
    site_name = ifelse(
      site_name == "Fairbanks State Office Building",
      "FSOB",
      site_name
      ),
    site_name = ifelse(
      site_name == "Hurst",
      "Hurst Road",
      site_name
    )
  ) |>
  mutate(
    Date = parse_date_time(Date, "mdy"),
    sample_measurement = round(sample_measurement, digits = 1)
  ) |>
  mutate(
    Date = as.Date(Date)
  )

## Import PM10 ----

pm10_import_named <- left_join(pm10_import, pm_sites, by = "site_id") |>
  select(date_local, sample_measurement, site_name) |>
  rename(Date = date_local) |>
  mutate(sample_measurement = round(sample_measurement, digits = 1))

## Import Gaseous --------------------------------------------------------------

# Import Armory 2002-2007 CO
armory_ex <- "*Armory*CO*csv"
armory_co <- import_files(armory_ex)

# Import Garden 2000-2023 CO
garden_ex <- "*Garden*CO*csv"
garden_co <- import_files(garden_ex)

# Import Hunter 2000-2009 CO
hunter_ex <- "*Hunter*CO*csv"
hunter_co <- import_files(hunter_ex)

# Import NCORE 2011-2023 CO
ncore_ex_co <- "*NCore*CO*csv"
ncore_co <- import_files(ncore_ex_co)

# Import Old PO 2000-2014 CO
oldpo_ex <- "*OldPostOffice*CO*csv"
oldpo_co <- import_files(oldpo_ex)

# Calculate CO 8-hr avg
armory_co_8hr_avg <- calc_co_8hr_avg(armory_co, "Armory")
garden_co_8hr_avg <- calc_co_8hr_avg(garden_co, "Garden")
hunter_co_8hr_avg <- calc_co_8hr_avg(hunter_co, "Hunter")
ncore_co_8hr_avg <- calc_co_8hr_avg(ncore_co, "NCore")
oldpo_co_8hr_avg <- calc_co_8hr_avg(oldpo_co, "Old Post Office")

co_8hr_avg <- bind_rows(
  armory_co_8hr_avg,
  garden_co_8hr_avg,
  hunter_co_8hr_avg,
  ncore_co_8hr_avg,
  oldpo_co_8hr_avg
) |>
  rename(sample_measurement = "avg_8hr")

# Import SO2 -------------------------------------------------------------------
ncore_ex_so2 <- "*NCore*SO2*csv"
ncore_so2 <- import_files(ncore_ex_so2)

hurst_ex_so2 <- "*Hurst*SO2*csv"
hurst_so2 <- import_files(hurst_ex_so2)

ncore_so2_1hr_max <- calc_so2_1hr_max(ncore_so2, "NCore")
hurst_so2_1hr_max <- calc_so2_1hr_max(hurst_so2, "Hurst Road")

so2_1hr_max <- bind_rows(
  ncore_so2_1hr_max,
  hurst_so2_1hr_max
) |>
  rename(sample_measurement = "max_1hr")

# Import O3 --------------------------------------------------------------------
ncore_ex_o3 <- "*NCore*O3*csv"
ncore_o3 <- import_files(ncore_ex_o3)

# Calculate o3 8-hr average
ncore_o3_8hr_avg <- calc_o3_8hr_avg(ncore_o3, "NCore") |>
  rename(sample_measurement = "avg_8hr")

# Import NO2 -------------------------------------------------------------------
ncore_ex_no2 <- "*NCore*NO2*csv"
ncore_no2 <- import_files(ncore_ex_no2)

# Calculate NO2 1-hr max
ncore_no2_1hr_max <- calc_no2_1hr_max(ncore_no2, "NCore") |>
  rename(sample_measurement = "max_1hr")

## Import DVs ------------------------------------------------------------------

# Import PM25 DVs --------------------------------------------------------------

pm25_dvs <- read_csv(
  "data-raw/Copies of DV/PM25_dv.csv",
  show_col_types = FALSE
) |>
  rename(
    percentile_EPA_ex = "98th percentile (excluding EPA concurred exceptional events)",
    percentile_DEC_ex = "98th percentile (excluding DEC exceptional events)",
    dv_24hr_EPA_ex = "24-Hour Design Value (excluding EPA concurred exceptional events)",
    dv_24hr_DEC_ex = "24-Hour Design Value (excluding DEC exceptional events)",
    Year = year
  ) |>
  select(
    site_name,
    Year,
    percentile_EPA_ex,
    percentile_DEC_ex,
    dv_24hr_EPA_ex,
    dv_24hr_DEC_ex
  ) |>
  filter(
    !is.na(percentile_EPA_ex) |
    !is.na(percentile_DEC_ex) |
    !is.na(dv_24hr_EPA_ex) |
    !is.na(dv_24hr_DEC_ex)
  ) |>
  mutate(
    site_name = if_else(
      site_name == "Nordale Elementary School - Hamilton and Eureka",
      "Nordale Elementary",
      site_name
    )
  ) |>
  mutate(
    site_name = if_else(
      site_name == "NP Elementary - 250 Snowman Lane",
      "North Pole Elementary",
      site_name
    )
  ) |>
  mutate(
    site_name = if_else(
      site_name == "North Pole Water - 2696 Mockler Ave.",
      "North Pole Water",
      site_name
    )
  ) |>
  mutate(
    site_name = if_else(
      site_name == "Wood River - 5000 Palo Verde Ave.",
      "Woodriver",
      site_name
    )
  ) |>
  mutate(
    site_name = if_else(
      site_name == "Soldotna 144 N Binkley St.",
      "Soldotna",
      site_name
    )
  ) |>
  mutate(
    site_name = if_else(
      site_name == "Wasilla - 100 W Swanson Ave.",
      "Wasilla",
      site_name
    )
  ) |>
  mutate(site_name = if_else(site_name == "Hurst", "Hurst Road", site_name)) |>
  mutate(percentile_EPA_ex = as.numeric(percentile_EPA_ex)) |>
  pivot_longer(cols = 3:6, names_to = "value_type", values_to = "value")

pm25_dvs_sw <- pm25_dvs |>
  filter(site_name == "Bethel")

pm25_dvs_jnu <- pm25_dvs |>
  filter(
    site_name == "Floyd Dryden" |
    site_name == "Lemon Creek"
  ) |> arrange(site_name, Year)

pm25_dvs_ms <- pm25_dvs |>
  filter(
    site_name == "Butte" |
    site_name == "Palmer" |
    site_name == "Wasilla"
  ) |> arrange(site_name, Year)

pm25_dvs_anc <- pm25_dvs |>
  filter(
    site_name == "Garden" |
    site_name == "Tudor" |
    site_name == "DHHS" |
    site_name == "Parkgate"
  ) |> arrange(site_name, Year)

pm25_dvs_fbx <- pm25_dvs |>
  filter(
    site_name == "Fairbanks State Office Building" |
    site_name == "Nordale Elementary" |
    site_name == "NCore" |
    site_name == "A Street" |
    site_name == "Woodriver" |
    site_name == "Hurst Road"
  ) |> arrange(site_name, Year)

pm25_dvs_np <- pm25_dvs |>
  filter(
    site_name == "North Pole Elementary" |
    site_name == "North Pole Water"
) |> arrange(site_name, Year)

# Import PM10 DVs --------------------------------------------------------------

pm10_dvs <- read_csv(
  paste(
    input_path_dv,
    "/PM10_24hr_first_second_maximum.csv",
    sep=""
  ),
  show_col_types = FALSE
) |>
  rename(first_max = "first maximum",
         second_max = "second maximum",
         Year = year) |>
  select(site_name, Year, first_max, second_max) |>
  filter(!is.na(first_max) | !is.na(second_max)) |>
  pivot_longer(cols = 3:4, names_to = "value_type", values_to = "value") |>
  mutate(
    value_type = ifelse(
      value_type == "first_max",
      "First Maximum",
      "Second Maximum"
    )
  )

pm10_dvs_sw <- pm10_dvs |> filter(site_name == "Bethel")

pm10_dvs_jnu <- pm10_dvs |> filter(site_name == "Floyd Dryden")

pm10_dvs_ms <- pm10_dvs |>
  filter(
    site_name == "Butte" |
    site_name == "Palmer" |
    site_name == "Wasilla" |
    site_name == "PMC"
  )

pm10_dvs_anc <- pm10_dvs |>
  filter(
    site_name == "Garden" |
    site_name == "Muldoon" |
    site_name == "Tudor" |
    site_name == "Laurel" |
    site_name == "DHHS" |
    site_name == "Parkgate" |
    site_name == "Oceanview"
  )

pm10_dvs_fbx <- pm10_dvs |>
  filter(site_name == "NCore" | site_name == "Fairbanks State Office Building")

# Import CO DVs ----------------------------------------------------------------

co_dvs <- read_csv(
  paste(
    input_path_dv,
    "/CO_8hr_maximum.csv",
    sep=""
  ),
  show_col_types = FALSE
) |>
  select(site_name, year, "8 hour 1st maximum", "8 hour 2nd maximum") |>
  rename(
    max_8hr = "8 hour 1st maximum",
    max_8hr_2 = "8 hour 2nd maximum",
    Year = year
  ) |>
  filter(!is.na(max_8hr), !is.na(max_8hr_2), !is.na(site_name)) |>
  mutate(site_name = ifelse(site_name == "Ncore", "NCore", site_name)) |>
  pivot_longer(cols = 3:4, names_to = "value_type", values_to = "value") |>
  mutate(
    value_type = ifelse(
      value_type == "max_8hr", "First Maximum", "Second Maximum"
    )
  )

# Filter to FBX CO monitoring sites
co_dvs_fbx <- co_dvs |>
  filter(
    site_name == "Old Post Office" |
    site_name == "Fairbanks State Office Building" |
    site_name == "Hunter Elementary" | site_name == "Armory" |
    site_name == "NCore"
)

# Filter to ANC CO monitoring sites
co_dvs_anc <- co_dvs |>
  filter(
    site_name == "Garden" |
    site_name == "Benson and Spenard" |
    site_name == "Benson and Seward Highway" |
    site_name == "Turnagain" |
    site_name == "Bowman Elementary" |
    site_name == "Parkgate" |
    site_name == "DHHS"
)

# Import O3 DVs ----------------------------------------------------------------
o3_dvs <- read_csv(
  paste(
    input_path_dv,
    "/O3_8hr_maximum.csv",
    sep=""
  ),
  show_col_types = FALSE
) |>
  select(site_name, year, "8 hour maximum", "3-year design value") |>
  rename(max_8hr = "8 hour maximum", dv_3yr = "3-year design value",
         Year = year) |>
  filter(!is.na(max_8hr) | !is.na(dv_3yr), !is.na(site_name)) |>
  pivot_longer(cols = 3:4, names_to = "value_type", values_to = "value") |>
  mutate(
    value_type = ifelse(
      value_type == "max_8hr", "Fourth Maximum", "3-Year Design Value"
    )
  )

o3_dvs_fbx <- o3_dvs |> filter(site_name == "NCore")

o3_dvs_anc <- o3_dvs |> filter(site_name == "Garden" | site_name == "Parkgate")

o3_dvs_ms <- o3_dvs |> filter(site_name == "Wasilla")

# Import SO2 DVs ---------------------------------------------------------------
so2_dvs <- read_csv(
  paste(
    input_path_dv,
    "/SO2_1hr_maximum.csv",
    sep=""
  ),
  show_col_types = FALSE
) |>
  select(site_name, year, "1 hr maximum", "3-year design value") |>
  rename(
    max_1hr = "1 hr maximum",
    dv_3yr = "3-year design value",
    Year = year
  ) |>
  filter(!is.na(max_1hr), !is.na(dv_3yr)) |>
  pivot_longer(cols = 3:4, names_to = "value_type", values_to = "value") |>
  mutate(
    value_type = ifelse(
      value_type == "max_1hr", "1-hr Maximum", "3-Year Design Value"
    ),
    site_name = ifelse(
      site_name == "Hurst", "Hurst Road", site_name
    )
  )

# Import NO2 DVs ---------------------------------------------------------------
no2_dvs <- read_csv(
  paste(
    input_path_dv,
    "/NO2_1hr_maximum.csv",
    sep=""
  ),
  show_col_types = FALSE
) |>
  select(site_name, year, "1 hour maximum", "3-year design value") |>
  rename(
    max_1hr = "1 hour maximum",
    dv_3yr = "3-year design value",
    Year = year
  ) |>
  filter(!is.na(max_1hr), !is.na(dv_3yr)) |>
  pivot_longer(cols = 3:4, names_to = "value_type", values_to = "value") |>
  mutate(
    value_type = ifelse(
      value_type == "max_1hr", "1-hr Maximum", "3-Year Design Value"
    )
  )

## Import NAAQS Table
naaqs_data <- read_csv("data-raw/pm25_naaqs.csv", show_col_types = FALSE)

## Write datasets --------------------------------------------------------------

# save average concentration data
use_data(pm25_import_named, overwrite = TRUE)
use_data(pm10_import_named, overwrite = TRUE)
use_data(co_8hr_avg, overwrite = TRUE)
use_data(ncore_o3_8hr_avg, overwrite = TRUE)
use_data(ncore_no2_1hr_max, overwrite = TRUE)
use_data(so2_1hr_max, overwrite = TRUE)

# save design value data
use_data(pm25_dvs_anc, overwrite = TRUE)
use_data(pm25_dvs_fbx, overwrite = TRUE)
use_data(pm25_dvs_jnu, overwrite = TRUE)
use_data(pm25_dvs_ms, overwrite = TRUE)
use_data(pm25_dvs_sw, overwrite = TRUE)
use_data(pm25_dvs_np, overwrite = TRUE)
use_data(pm10_dvs_anc, overwrite = TRUE)
use_data(pm10_dvs_fbx, overwrite = TRUE)
use_data(pm10_dvs_jnu, overwrite = TRUE)
use_data(pm10_dvs_ms, overwrite = TRUE)
use_data(pm10_dvs_sw, overwrite = TRUE)
use_data(co_dvs_anc, overwrite = TRUE)
use_data(co_dvs_fbx, overwrite = TRUE)
use_data(so2_dvs, overwrite = TRUE)
use_data(no2_dvs, overwrite = TRUE)
use_data(o3_dvs_anc, overwrite = TRUE)
use_data(o3_dvs_fbx, overwrite = TRUE)
use_data(o3_dvs_ms, overwrite = TRUE)

# save naaqs
use_data(naaqs_data, overwrite = TRUE)
