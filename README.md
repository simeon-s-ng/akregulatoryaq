
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{akregulatoryaq}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

You can install the development version of `{akregulatoryaq}` like so:

``` r
pak::pkg_install("simeon-s-ng/akregulatoryaq")
```

## Run

You can launch the application by running:

``` r
akregulatoryaq::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2024-09-25 15:04:05 AKDT"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading akregulatoryaq
#> ── R CMD check results ────────────────────────── akregulatoryaq 0.0.0.9000 ────
#> Duration: 44.2s
#> 
#> ❯ checking package subdirectories ... NOTE
#>   Problems with news in 'NEWS.md':
#>   No news entries found.
#> 
#> ❯ checking R code for possible problems ... NOTE
#>   mod_co_avg_server : <anonymous>: no visible binding for global variable
#>     'co_8hr_avg'
#>   mod_co_avg_server : <anonymous>: no visible binding for global variable
#>     'site_name'
#>   mod_co_avg_server : <anonymous>: no visible binding for global variable
#>     'Date'
#>   mod_co_dv_server : <anonymous>: no visible binding for global variable
#>     'co_dvs_fbx'
#>   mod_co_dv_server : <anonymous>: no visible binding for global variable
#>     'co_dvs_anc'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'pm25_import_named'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'pm10_import_named'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'co_8hr_avg'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'so2_1hr_max'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'ncore_o3_8hr_avg'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'ncore_no2_1hr_max'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'site_name'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'Date'
#>   mod_download_server : <anonymous>: no visible binding for global
#>     variable 'sample_measurement'
#>   mod_no2_avg_server : <anonymous>: no visible binding for global
#>     variable 'ncore_no2_1hr_max'
#>   mod_no2_avg_server : <anonymous>: no visible binding for global
#>     variable 'Date'
#>   mod_no2_dv_server : <anonymous>: no visible binding for global variable
#>     'no2_dvs'
#>   mod_o3_avg_server : <anonymous>: no visible binding for global variable
#>     'ncore_o3_8hr_avg'
#>   mod_o3_avg_server : <anonymous>: no visible binding for global variable
#>     'Date'
#>   mod_o3_dv_server : <anonymous>: no visible binding for global variable
#>     'o3_dvs_fbx'
#>   mod_o3_dv_server : <anonymous>: no visible binding for global variable
#>     'o3_dvs_anc'
#>   mod_o3_dv_server : <anonymous>: no visible binding for global variable
#>     'o3_dvs_ms'
#>   mod_pm10_avg_server : <anonymous>: no visible binding for global
#>     variable 'pm10_import_named'
#>   mod_pm10_avg_server : <anonymous>: no visible binding for global
#>     variable 'site_name'
#>   mod_pm10_avg_server : <anonymous>: no visible binding for global
#>     variable 'Date'
#>   mod_pm10_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm10_dvs_fbx'
#>   mod_pm10_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm10_dvs_anc'
#>   mod_pm10_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm10_dvs_jnu'
#>   mod_pm10_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm10_dvs_ms'
#>   mod_pm10_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm10_dvs_sw'
#>   mod_pm25_avg_server : <anonymous>: no visible binding for global
#>     variable 'pm25_import_named'
#>   mod_pm25_avg_server : <anonymous>: no visible binding for global
#>     variable 'site_name'
#>   mod_pm25_avg_server : <anonymous>: no visible binding for global
#>     variable 'Date'
#>   mod_pm25_dec_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_fbx'
#>   mod_pm25_dec_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_anc'
#>   mod_pm25_dec_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_jnu'
#>   mod_pm25_dec_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_ms'
#>   mod_pm25_dec_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_sw'
#>   mod_pm25_epa_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_fbx'
#>   mod_pm25_epa_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_anc'
#>   mod_pm25_epa_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_jnu'
#>   mod_pm25_epa_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_ms'
#>   mod_pm25_epa_dv_server : <anonymous>: no visible binding for global
#>     variable 'pm25_dvs_sw'
#>   mod_so2_avg_server : <anonymous>: no visible binding for global
#>     variable 'so2_1hr_max'
#>   mod_so2_avg_server : <anonymous>: no visible binding for global
#>     variable 'site_name'
#>   mod_so2_avg_server : <anonymous>: no visible binding for global
#>     variable 'Date'
#>   mod_so2_dv_server : <anonymous>: no visible binding for global variable
#>     'so2_dvs'
#>   naaqs_table: no visible binding for global variable 'naaqs_data'
#>   naaqs_table: no visible global function definition for 'everything'
#>   plot_co: no visible binding for global variable 'Date'
#>   plot_co: no visible binding for global variable 'sample_measurement'
#>   plot_co: no visible binding for global variable 'site_name'
#>   plot_co_dv: no visible binding for global variable 'Year'
#>   plot_co_dv: no visible binding for global variable 'value'
#>   plot_co_dv: no visible binding for global variable 'value_type'
#>   plot_co_dv: no visible binding for global variable 'site_name'
#>   plot_no2: no visible binding for global variable 'Date'
#>   plot_no2: no visible binding for global variable 'sample_measurement'
#>   plot_no2: no visible binding for global variable 'site_name'
#>   plot_no2_dv: no visible binding for global variable 'Year'
#>   plot_no2_dv: no visible binding for global variable 'value'
#>   plot_no2_dv: no visible binding for global variable 'value_type'
#>   plot_no2_dv: no visible binding for global variable 'site_name'
#>   plot_o3: no visible binding for global variable 'Date'
#>   plot_o3: no visible binding for global variable 'sample_measurement'
#>   plot_o3: no visible binding for global variable 'site_name'
#>   plot_o3_dv: no visible binding for global variable 'Year'
#>   plot_o3_dv: no visible binding for global variable 'value'
#>   plot_o3_dv: no visible binding for global variable 'value_type'
#>   plot_o3_dv: no visible binding for global variable 'site_name'
#>   plot_pm10: no visible binding for global variable 'Date'
#>   plot_pm10: no visible binding for global variable 'sample_measurement'
#>   plot_pm10: no visible binding for global variable 'site_name'
#>   plot_pm10_dv: no visible binding for global variable 'Year'
#>   plot_pm10_dv: no visible binding for global variable 'value'
#>   plot_pm10_dv: no visible binding for global variable 'value_type'
#>   plot_pm10_dv: no visible binding for global variable 'site_name'
#>   plot_pm25: no visible binding for global variable 'Date'
#>   plot_pm25: no visible binding for global variable 'sample_measurement'
#>   plot_pm25: no visible binding for global variable 'site_name'
#>   plot_pm25_dec_dv: no visible binding for global variable 'value_type'
#>   plot_pm25_dec_dv: no visible binding for global variable 'Year'
#>   plot_pm25_dec_dv: no visible binding for global variable 'value'
#>   plot_pm25_dec_dv: no visible binding for global variable 'site_name'
#>   plot_pm25_epa_dv: no visible binding for global variable 'value_type'
#>   plot_pm25_epa_dv: no visible binding for global variable 'Year'
#>   plot_pm25_epa_dv: no visible binding for global variable 'value'
#>   plot_pm25_epa_dv: no visible binding for global variable 'site_name'
#>   plot_so2: no visible binding for global variable 'Date'
#>   plot_so2: no visible binding for global variable 'sample_measurement'
#>   plot_so2: no visible binding for global variable 'site_name'
#>   plot_so2_dv: no visible binding for global variable 'Year'
#>   plot_so2_dv: no visible binding for global variable 'value'
#>   plot_so2_dv: no visible binding for global variable 'value_type'
#>   plot_so2_dv: no visible binding for global variable 'site_name'
#>   Undefined global functions or variables:
#>     Date Year co_8hr_avg co_dvs_anc co_dvs_fbx everything naaqs_data
#>     ncore_no2_1hr_max ncore_o3_8hr_avg no2_dvs o3_dvs_anc o3_dvs_fbx
#>     o3_dvs_ms pm10_dvs_anc pm10_dvs_fbx pm10_dvs_jnu pm10_dvs_ms
#>     pm10_dvs_sw pm10_import_named pm25_dvs_anc pm25_dvs_fbx pm25_dvs_jnu
#>     pm25_dvs_ms pm25_dvs_sw pm25_import_named sample_measurement
#>     site_name so2_1hr_max so2_dvs value value_type
#> 
#> 0 errors ✔ | 0 warnings ✔ | 2 notes ✖
```

``` r
covr::package_coverage()
#> Error in loadNamespace(x): there is no package called 'covr'
```
