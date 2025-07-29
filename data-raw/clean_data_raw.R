# clean_data_raw.R
# Cleaning regulatory data for Shiny App
# Updated 7/23/25

library(tidyverse)
library(zoo)
library(usethis)

# NEW Global Input Path ----
input_data_raw <- "//decan-srvfile/decan-srvfile/Groups/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/data-raw/"

# Import function ----

column_list <- c(
  "state_code",
  "county_code",
  "site_number",
  "parameter_code",
  "poc",
  "duration_code",
  "unit_code",
  "method_code",
  "sample_begin_date",
  "sample_begin_time",
  "sample_measurement",
  "null_code",
  "qualifier_code_one",
  "qualifier_code_two",
  "qualifier_code_three",
  "qualifier_code_four",
  "qualifier_code_five",
  "qualifier_code_six",
  "qualifier_code_seven",
  "qualifier_code_eight",
  "qualifier_code_nine",
  "qualifier_code_ten",
  "reported_sample_measurement",
  "reported_unit_code",
  "monitoring_agency"
)

import_data_raw <- function(file_ex) {
  files <- fs::dir_ls(path = input_data_raw, glob = file_ex)
  import <- read_csv(files, id = "path") |>
    select(column_list) |>
    mutate(sample_begin_date = lubridate::parse_date_time(sample_begin_date, "ymd")) |>
    mutate(sample_begin_date = lubridate::parse_date_time(paste(sample_begin_date, sample_begin_time), "ymd HMS")) |>
    rename(Date = sample_begin_date) |>
    select(-sample_begin_time)
  return(import)
}

# Helper functions ----

mean_valid_pm25_24hr <- function(data) {
  if(sum(is.na(data)) > length(data) * 0.25) {
    calc_sub_24_hr <- data |>
      replace_na(0) |> # sub with 0
      mean()
    if(calc_sub_24_hr > 35) {
      return(calc_sub_24_hr)
    }
    else{
      return(NA)
    }
  }
  else {
    return(mean(data, na.rm = TRUE))
  }
}

calc_pm25_24hr_avg <- function(data) {
  return(
    arrange(data, Date) |>
    complete(Date = seq(floor_date(min(Date), "day"), max(Date), 'hour')) |>
    mutate(
      sample_measurement = trunc(
        rollapply(
          sample_measurement,
          width = 24,
          by = 24,
          FUN = mean_valid_pm25_24hr,
          align = "left",
          fill = NA
        ) * 10
      ) / 10
    )
  )
}

# Import PM25 ----

## A Street PM25 ----

Ast_pm25_ex <- "*AStreet*PM25*csv"
Ast_pm25_import <- import_data_raw(Ast_pm25_ex)

Ast_pm25_1 <- Ast_pm25_import |>
  filter(poc == 1) |>
  mutate(Date = as.Date(Date)) |>
  complete(Date = seq.Date(min(Date), max(Date), by = "day"))

Ast_pm25_3 <- Ast_pm25_import |>
  filter(poc == 3) |>
  calc_pm25_24hr_avg() |>
  filter(!is.na(sample_measurement))

Ast_pm25 <- full_join(Ast_pm25_1, Ast_pm25_3, by = "Date") |>
  mutate(
    sample_measurement = if_else(
      is.na(sample_measurement.x),
      trunc(sample_measurement.y * 10) / 10,
      trunc(sample_measurement.x * 10) / 10
    ),
    site_name = "A Street"
  ) |>
  select(Date, sample_measurement, site_name)

## Bethel PM25 ----

Bethel_pm25_ex <- "*Bethel*PM25*csv"
Bethel_pm25_import <- import_data_raw(Bethel_pm25_ex)

Bethel_pm25 <- Bethel_pm25_import |>
  calc_pm25_24hr_avg() |>
  filter(!is.na(sample_measurement)) |>
  mutate(site_name = "Bethel") |>
  select(Date, sample_measurement, site_name)

## Butte PM25 ----

Butte_pm25_ex <- "*Butte*PM25*csv"
Butte_pm25_import <- import_data_raw(Butte_pm25_ex)

Butte_pm25_1 <- Butte_pm25_import |>
  filter(poc == 1) |>
  mutate(Date = as.Date(Date)) |>
  complete(Date = seq.Date(min(Date), max(Date), by = "day"))

Butte_pm25_3 <- Butte_pm25_import |>
  filter(poc == 3) |>
  mutate(Date = date(Date)) |>
  group_by(Date) |>
  summarise(sample_measurement = mean(sample_measurement, na.rm = FALSE))

Butte_pm25 <- full_join(Butte_pm25_1, Butte_pm25_3, by = "Date") |>
  mutate(
    sample_measurement = if_else(
      is.na(sample_measurement.x),
      trunc(sample_measurement.y * 10) / 10,
      trunc(sample_measurement.x * 10) / 10
    ),
    site_name = "Butte"
  ) |>
  select(Date, sample_measurement, site_name)

## DHHS PM25 ----

DHHS_pm25_ex <- "*DHHS*PM25*csv"
DHHS_pm25_import <- import_data_raw(DHHS_pm25_ex) |>
  mutate(site_name = "DHHS")

DHHS_pm25 <- DHHS_pm25_import |>
  calc_pm25_24hr_avg() |>
  filter(!is.na(sample_measurement)) |>
  mutate(site_name = "DHHS") |>
  select(Date, sample_measurement, site_name)

## Floyd Dryden PM25 ----

FloydDryden_pm25_ex <- "*FloydDryden*PM25*csv"
FloydDryden_pm25_import <- import_data_raw(FloydDryden_pm25_ex) |>
  mutate(site_name = "Floyd Dryden") # Daily & Hourly

FloydDryden_pm25_1 <- FloydDryden_pm25_import |>
  filter(poc == 1)

## Garden PM25 ----

Garden_pm25_ex <- "*Garden*PM25*csv"
Garden_pm25_import <- import_data_raw(Garden_pm25_ex) |>
  mutate(site_name = "Garden")

Hurst_pm25_ex <- "*Hurst*PM25*csv"
Hurst_pm25_import <- import_data_raw(Hurst_pm25_ex) |>
  mutate(site_name = "Hurst Road")

LemonCreek_pm25_ex <- "*LemonCreek*PM25*csv"
LemonCreek_pm25_import <- import_data_raw(LemonCreek_pm25_ex) |>
  mutate(site_name = "Lemon Creek")

NCore_pm25_ex <- "*NCore*PM25*csv"
NCore_pm25_import <- import_data_raw(NCore_pm25_ex) |>
  mutate(site_name = "NCore")

Palmer_pm25_ex <- "*Palmer*PM25*csv"
Palmer_pm25_import <- import_data_raw(Palmer_pm25_ex) |>
  mutate(site_name = "Palmer")

Parkgate_pm25_ex <- "*Parkgate*PM25*csv"
Parkgate_pm25_import <- import_data_raw(Parkgate_pm25_ex) |>
  mutate(site_name = "Parkgate")

PMC_pm25_ex <- "*PMC*PM25*csv"
PMC_pm25_import <- import_data_raw(PMC_pm25_ex) |>
  mutate(site_name = "Plant Materials Center")

SOB_pm25_ex <- "*SOB*PM25*csv"
SOB_pm25_import <- import_data_raw(SOB_pm25_ex) |>
  mutate(site_name = "FSOB")

Soldotna_pm25_ex <- "*Soldotna*PM25*csv"
Soldotna_pm25_import <- import_data_raw(Soldotna_pm25_ex) |>
  mutate(site_name = "Soldotna")

Tudor_pm25_ex <- "*Tudor*PM25*csv"
Tudor_pm25_import <- import_data_raw(Tudor_pm25_ex) |>
  mutate(site_name = "Tudor")

Wasilla_pm25_ex <- "*Wasilla*PM10*csv"
Wasilla_pm25_import <- import_data_raw(Wasilla_pm25_ex) |>
  mutate(site_name = "Wasilla")

# Import PM10 ----

Bethel_pm10_ex <- "*Bethel*PM10*csv"
Bethel_pm10_import <- import_data_raw(Bethel_pm10_ex) |>
  mutate(site_name = "Bethel")

Butte_pm10_ex <- "*Butte*PM10*csv"
Butte_pm10_import <- import_data_raw(Butte_pm10_ex) |>
  mutate(site_name = "Butte")

DHHS_pm10_ex <- "*DHHS*PM10*csv"
DHHS_pm10_import <- import_data_raw(DHHS_pm10_ex) |>
  mutate(site_name = "DHHS")

FloydDryden_pm10_ex <- "*FloydDryden*PM10*csv"
FloydDryden_pm10_import <- import_data_raw(FloydDryden_pm10_ex) |>
  mutate(site_name = "Floyd Dryden")

Garden_pm10_ex <- "*Garden*PM10*csv"
Garden_pm10_import <- import_data_raw(Garden_pm10_ex) |>
  mutate(site_name = "Garden")

Laurel_pm10_ex <- "*Laurel*PM10*csv"
Laurel_pm10_import <- import_data_raw(Laurel_pm10_ex) |>
  mutate(site_name = "Laurel")

Muldoon_pm10_ex <- "*Muldoon*PM10*csv"
Muldoon_pm10_import <- import_data_raw(Muldoon_pm10_ex) |>
  mutate(site_name = "Muldoon")

NCore_pm10_ex <- "*NCore*PM10*csv"
NCore_pm10_import <- import_data_raw(NCore_pm10_ex) |>
  mutate(site_name = "NCore")

Palmer_pm10_ex <- "*Palmer*PM10*csv"
Palmer_pm10_import <- import_data_raw(Palmer_pm10_ex) |>
  mutate(site_name = "Palmer")

Parkgate_pm10_ex <- "*Parkgate*PM10*csv"
Parkgate_pm10_import <- import_data_raw(Parkgate_pm10_ex) |>
  mutate(site_name = "Parkgate")

PMC_pm10_ex <- "*PMC*PM10*csv"
PMC_pm10_import <- import_data_raw(PMC_pm10_ex) |>
  mutate(site_name = "PMC")

SOB_pm10_ex <- "*SOB*PM10*csv"
SOB_pm10_import <- import_data_raw(SOB_pm10_ex) |>
  mutate(site_name = "FSOB")

Soldotna_pm10_ex <- "*Soldotna*PM10*csv"
Soldotna_pm10_import <- import_data_raw(Soldotna_pm10_ex) |>
  mutate(site_name = "Soldotna")

Tudor_pm10_ex <- "*Tudor*PM10*csv"
Tudor_pm10_import <- import_data_raw(Tudor_pm10_ex) |>
  mutate(site_name = "Tudor")

Wasilla_pm10_ex <- "*Wasilla*PM10*csv"
Wasilla_pm10_import <- import_data_raw(Wasilla_pm10_ex) |>
  mutate(site_name = "Wasilla")

# Import CO ----

Armory_co_ex <- "*Armory*CO*csv"
Armory_co_import <- import_data_raw(Armory_co_ex) |>
  mutate(site_name = "Armory")

DHHS_co_ex <- "*DHHS*CO*csv"
DHHS_co_import <- import_data_raw(DHHS_co_ex) |>
  mutate(site_nam = "DHHS")

Garden_co_ex <- "*Garden*CO*csv"
Garden_co_import <- import_data_raw(Garden_co_ex) |>
  mutate(site_name = "Garden")

NCore_co_ex <- "*NCore*CO*csv"
NCore_co_import <- import_data_raw(NCore_co_ex) |>
  mutate(site_name = "NCore")

OldPostOffice_co_ex <- "*OldPostOffice*CO*csv"
OldPOstOffice_co_import <- import_data_raw(OldPostOffice_co_ex) |>
  mutate(site_name = "Old Post Office")

Parkgate_co_ex <- "*Parkgate*CO*csv"
Parkgate_co_import <- import_data_raw(Parkgate_co_ex) |>
  mutate(site_name = "Parkgate")

SOB_co_ex <- "*SOB*CO*csv"
SOB_co_import <- import_data_raw(SOB_co_ex) |>
  mutate(site_name = "FSOB")

Turnagain_co_ex <- "*Turnagain*CO*csv"
Turnagain_co_import <- import_data_raw(Turnagain_co_ex) |>
  mutate(site_name = "Turnagain")

# Import SO2 ----

Hurst_so2_ex <- "*Hurst*SO2*csv"
Hurst_so2_import <- import_data_raw(Hurst_so2_ex) |>
  mutate(site_name = "Hurst Road")

NCore_so2_ex <- "*NCore*SO2*csv"
NCore_so2_import <- import_data_raw(NCore_so2_ex) |>
  mutate(site_name = "NCore")

# Import O3 ----

NCore_o3_ex <- "*NCore*O3*csv"
NCore_o3_import <- import_data_raw(NCore_o3_ex) |>
  mutate(site_name = "NCore")

# Import NO2 ----

NCore_no2_ex <- "*NCore*NO2*csv"
NCore_no2_import <- import_data_raw(NCore_no2_ex) |>
  mutate(site_name = "NCore")
