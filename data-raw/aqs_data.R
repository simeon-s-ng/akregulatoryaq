# aqs_data.R
# Pulling historical data from AQS

library(tidyverse)
library(keyring)
library(RAQSAPI)

# AQS Default Credentials ----

datamartAPI_user <- "simeon.ng@alaska.gov"
server <- "AQSDatamart"
write_path <- "G:/AQ/Monitor/Data/Data_Analysis/2024_Web_Figure_Update/data-raw"

aqs_credentials(
  username = datamartAPI_user,
  key = key_get(service = server, username = datamartAPI_user)
)

# Write data to Shared Drive ----

years <- seq("2018", "2020") # Year range of site/pollutant

for(i in seq_along(years)) {
  write_csv(
    aqs_transactionsample_by_site(
      parameter = "81102",
      bdate = as.Date(paste0(years[[i]], "0101"), format = "%Y%m%d"),
      edate = as.Date(paste0(years[[i]], "1231"), format = "%Y%m%d"),
      stateFIPS = "02",
      countycode = "050",
      sitenum = "0001"
    ),
    file = paste0(write_path, "/Bethel_", years[[i]], "_PM10", ".csv")
  )
  Sys.sleep(10) # AQS only alllows 10 requests per minute. Pause 10s to space requests out.
}

