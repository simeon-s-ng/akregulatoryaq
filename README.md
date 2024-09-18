
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
#> [1] "2024-09-18 13:35:23 AKDT"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading akregulatoryaq
#> ── R CMD check results ────────────────────────── akregulatoryaq 0.0.0.9000 ────
#> Duration: 46.8s
#> 
#> ❯ checking R files for non-ASCII characters ... WARNING
#>   Found the following files with non-ASCII characters:
#>     fct_ui_helpers.R
#>     utils_plots_avg.R
#>     utils_plots_dv.R
#>   Portable packages must use only ASCII characters in their R code,
#>   except perhaps in comments.
#>   Use \uxxxx escapes for other characters.
#> 
#> ❯ checking for missing documentation entries ... WARNING
#>   Undocumented code objects:
#>     'co_8hr_avg' 'co_dvs_anc' 'co_dvs_fbx' 'ncore_no2_1hr_max'
#>     'ncore_o3_8hr_avg' 'no2_dvs' 'o3_dvs_anc' 'o3_dvs_fbx' 'o3_dvs_ms'
#>     'pm10_dvs_anc' 'pm10_dvs_fbx' 'pm10_dvs_jnu' 'pm10_dvs_ms'
#>     'pm10_dvs_sw' 'pm10_import_named' 'pm25_dvs_anc' 'pm25_dvs_fbx'
#>     'pm25_dvs_jnu' 'pm25_dvs_ms' 'pm25_dvs_np' 'pm25_dvs_sw'
#>     'pm25_import_named' 'so2_1hr_max' 'so2_dvs'
#>   Undocumented data sets:
#>     'co_8hr_avg' 'co_dvs_anc' 'co_dvs_fbx' 'ncore_no2_1hr_max'
#>     'ncore_o3_8hr_avg' 'no2_dvs' 'o3_dvs_anc' 'o3_dvs_fbx' 'o3_dvs_ms'
#>     'pm10_dvs_anc' 'pm10_dvs_fbx' 'pm10_dvs_jnu' 'pm10_dvs_ms'
#>     'pm10_dvs_sw' 'pm10_import_named' 'pm25_dvs_anc' 'pm25_dvs_fbx'
#>     'pm25_dvs_jnu' 'pm25_dvs_ms' 'pm25_dvs_np' 'pm25_dvs_sw'
#>     'pm25_import_named' 'so2_1hr_max' 'so2_dvs'
#>   All user-level objects in a package should have documentation entries.
#>   See chapter 'Writing R documentation files' in the 'Writing R
#>   Extensions' manual.
#> 
#> ❯ checking package subdirectories ... NOTE
#>   Problems with news in 'NEWS.md':
#>   No news entries found.
#> 
#> ❯ checking dependencies in R code ... NOTE
#>   Namespace in Imports field not imported from: 'pkgload'
#>     All declared Imports should be used.
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
#>   mod_download_server : <anonymous> : <anonymous>: no visible global
#>     function definition for 'write.csv'
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
#>   plot_co: no visible binding for global variable 'Date'
#>   plot_co: no visible binding for global variable 'avg_8hr'
#>   plot_co: no visible binding for global variable 'site_name'
#>   plot_co_dv: no visible binding for global variable 'Year'
#>   plot_co_dv: no visible binding for global variable 'max_8hr'
#>   plot_co_dv: no visible binding for global variable 'site_name'
#>   plot_co_dv: no visible binding for global variable 'max_8hr_2'
#>   plot_no2: no visible binding for global variable 'Date'
#>   plot_no2: no visible binding for global variable 'max_1hr'
#>   plot_no2: no visible binding for global variable 'site_name'
#>   plot_no2_dv: no visible binding for global variable 'Year'
#>   plot_no2_dv: no visible binding for global variable 'dv_3yr'
#>   plot_no2_dv: no visible binding for global variable 'site_name'
#>   plot_no2_dv: no visible binding for global variable 'max_1hr'
#>   plot_o3: no visible binding for global variable 'Date'
#>   plot_o3: no visible binding for global variable 'avg_8hr'
#>   plot_o3: no visible binding for global variable 'site_name'
#>   plot_o3_dv: no visible binding for global variable 'Year'
#>   plot_o3_dv: no visible binding for global variable 'max_8hr'
#>   plot_o3_dv: no visible binding for global variable 'site_name'
#>   plot_o3_dv: no visible binding for global variable 'dv_3yr'
#>   plot_pm10: no visible binding for global variable 'Date'
#>   plot_pm10: no visible binding for global variable 'sample_measurement'
#>   plot_pm10: no visible binding for global variable 'site_name'
#>   plot_pm10_dv: no visible binding for global variable 'Year'
#>   plot_pm10_dv: no visible binding for global variable 'first_max'
#>   plot_pm10_dv: no visible binding for global variable 'site_name'
#>   plot_pm10_dv: no visible binding for global variable 'second_max'
#>   plot_pm25: no visible binding for global variable 'Date'
#>   plot_pm25: no visible binding for global variable 'sample_measurement'
#>   plot_pm25: no visible binding for global variable 'site_name'
#>   plot_pm25_dec_dv: no visible binding for global variable 'Year'
#>   plot_pm25_dec_dv: no visible binding for global variable
#>     'percentile_DEC_ex'
#>   plot_pm25_dec_dv: no visible binding for global variable 'site_name'
#>   plot_pm25_dec_dv: no visible binding for global variable
#>     'dv_24hr_DEC_ex'
#>   plot_pm25_epa_dv: no visible binding for global variable 'Year'
#>   plot_pm25_epa_dv: no visible binding for global variable
#>     'percentile_EPA_ex'
#>   plot_pm25_epa_dv: no visible binding for global variable 'site_name'
#>   plot_pm25_epa_dv: no visible binding for global variable
#>     'dv_24hr_EPA_ex'
#>   plot_so2: no visible binding for global variable 'Date'
#>   plot_so2: no visible binding for global variable 'max_1hr'
#>   plot_so2: no visible binding for global variable 'site_name'
#>   plot_so2_dv: no visible binding for global variable 'Year'
#>   plot_so2_dv: no visible binding for global variable 'dv_3yr'
#>   plot_so2_dv: no visible binding for global variable 'site_name'
#>   plot_so2_dv: no visible binding for global variable 'max_1hr'
#>   Undefined global functions or variables:
#>     Date Year avg_8hr co_8hr_avg co_dvs_anc co_dvs_fbx dv_24hr_DEC_ex
#>     dv_24hr_EPA_ex dv_3yr first_max max_1hr max_8hr max_8hr_2
#>     ncore_no2_1hr_max ncore_o3_8hr_avg no2_dvs o3_dvs_anc o3_dvs_fbx
#>     o3_dvs_ms percentile_DEC_ex percentile_EPA_ex pm10_dvs_anc
#>     pm10_dvs_fbx pm10_dvs_jnu pm10_dvs_ms pm10_dvs_sw pm10_import_named
#>     pm25_dvs_anc pm25_dvs_fbx pm25_dvs_jnu pm25_dvs_ms pm25_dvs_sw
#>     pm25_import_named sample_measurement second_max site_name so2_1hr_max
#>     so2_dvs write.csv
#>   Consider adding
#>     importFrom("utils", "write.csv")
#>   to your NAMESPACE file.
#> 
#> 0 errors ✔ | 2 warnings ✖ | 3 notes ✖
#> Error: R CMD check found WARNINGs
```

``` r
covr::package_coverage()
#> Error in loadNamespace(x): there is no package called 'covr'
```
