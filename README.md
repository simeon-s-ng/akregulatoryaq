
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
#> ✔ Updated metadata database: 2.26 MB in 2 files.
#> ℹ Updating metadata database✔ Updating metadata database ... done
#>  
#> → Will install 87 packages.
#> → Will update 1 package.
#> → Will download 57 CRAN packages (33.26 MB), cached: 31 (58.44 MB).
#> + akregulatoryaq 0.0.0.9000 → 0.0.0.9000 [bld][cmp] (GitHub: c3922c0)
#> + anytime                     0.3.9      [dl] (741.83 kB)
#> + askpass                     1.2.0      [dl] (74.96 kB)
#> + attempt                     0.3.1      [dl] (122.47 kB)
#> + base64enc                   0.1-3      [dl] (32.65 kB)
#> + bsicons                     0.1.2      [dl] (258.32 kB)
#> + bslib                       0.8.0      
#> + cachem                      1.1.0      
#> + callr                       3.7.6      [dl] (460.36 kB)
#> + cli                         3.6.3      
#> + colorspace                  2.1-1      
#> + commonmark                  1.9.1      [dl] (142.41 kB)
#> + config                      0.3.2      [dl] (111.44 kB)
#> + crayon                      1.5.3      
#> + crosstalk                   1.2.1      [dl] (413.15 kB)
#> + curl                        5.2.2      
#> + data.table                  1.16.0     
#> + desc                        1.4.3      [dl] (329.59 kB)
#> + digest                      0.6.37     
#> + dplyr                       1.1.4      [dl] (1.56 MB)
#> + evaluate                    1.0.0      
#> + fansi                       1.0.6      [dl] (314.08 kB)
#> + farver                      2.1.2      
#> + fastmap                     1.2.0      
#> + fontawesome                 0.5.2      [dl] (1.36 MB)
#> + fs                          1.6.4      
#> + generics                    0.1.3      [dl] (79.76 kB)
#> + ggplot2                     3.5.1      
#> + ggthemes                    5.1.0      [dl] (454.74 kB)
#> + glue                        1.7.0      [dl] (161.28 kB)
#> + golem                       0.5.1      
#> + gtable                      0.3.5      
#> + here                        1.0.1      [dl] (64.15 kB)
#> + highr                       0.11       
#> + htmltools                   0.5.8.1    [dl] (359.17 kB)
#> + htmlwidgets                 1.6.4      [dl] (812.12 kB)
#> + httpuv                      1.6.15     [dl] (1.04 MB)
#> + httr                        1.4.7      [dl] (486.51 kB)
#> + isoband                     0.2.7      [dl] (1.97 MB)
#> + jquerylib                   0.1.4      [dl] (526.00 kB)
#> + jsonlite                    1.8.8      [dl] (1.11 MB)
#> + knitr                       1.48       
#> + labeling                    0.4.3      [dl] (62.57 kB)
#> + later                       1.3.2      [dl] (465.20 kB)
#> + lazyeval                    0.2.2      [dl] (161.28 kB)
#> + lifecycle                   1.0.4      [dl] (139.76 kB)
#> + lubridate                   1.9.3      [dl] (985.23 kB)
#> + magrittr                    2.0.3      [dl] (226.87 kB)
#> + memoise                     2.0.1      [dl] (50.00 kB)
#> + mime                        0.12       [dl] (40.83 kB)
#> + munsell                     0.5.1      [dl] (245.61 kB)
#> + openssl                     2.2.1      
#> + pillar                      1.9.0      [dl] (659.41 kB)
#> + pkgbuild                    1.4.4      [dl] (202.63 kB)
#> + pkgconfig                   2.0.3      [dl] (22.44 kB)
#> + pkgload                     1.4.0      
#> + plotly                      4.10.4     [dl] (3.26 MB)
#> + processx                    3.8.4      [dl] (686.72 kB)
#> + promises                    1.3.0      [dl] (2.02 MB)
#> + ps                          1.8.0      
#> + purrr                       1.0.2      [dl] (498.58 kB)
#> + R6                          2.5.1      [dl] (84.30 kB)
#> + rappdirs                    0.3.3      [dl] (51.42 kB)
#> + RColorBrewer                1.1-3      [dl] (56.07 kB)
#> + Rcpp                        1.0.13     
#> + rlang                       1.1.4      
#> + rmarkdown                   2.28       
#> + rprojroot                   2.0.4      [dl] (113.50 kB)
#> + sass                        0.4.9      [dl] (2.61 MB)
#> + scales                      1.3.0      [dl] (703.35 kB)
#> + shiny                       1.9.1      
#> + shinyWidgets                0.8.6      
#> + sourcetools                 0.1.7-1    [dl] (383.93 kB)
#> + stringi                     1.8.4      
#> + stringr                     1.5.1      [dl] (318.94 kB)
#> + sys                         3.4.2      [dl] (47.09 kB)
#> + tibble                      3.2.1      [dl] (690.81 kB)
#> + tidyr                       1.3.1      [dl] (1.27 MB)
#> + tidyselect                  1.2.1      [dl] (225.04 kB)
#> + timechange                  0.3.0      [dl] (507.75 kB)
#> + tinytex                     0.53       
#> + utf8                        1.2.4      [dl] (149.79 kB)
#> + vctrs                       0.6.5      [dl] (1.34 MB)
#> + viridisLite                 0.4.2      [dl] (1.30 MB)
#> + withr                       3.0.1      
#> + xfun                        0.47       
#> + xtable                      1.8-4      [dl] (706.19 kB)
#> + yaml                        2.3.10     
#> ℹ Getting 57 pkgs (33.26 MB), 31 (58.44 MB) cached
#> ✔ Cached copy of callr 3.7.6 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of promises 1.3.0 (x86_64-w64-mingw32) is the latest build
#> ✔ Got R6 2.5.1 (i386+x86_64-w64-mingw32) (84.31 kB)
#> ✔ Got RColorBrewer 1.1-3 (i386+x86_64-w64-mingw32) (56.07 kB)
#> ✔ Got attempt 0.3.1 (i386+x86_64-w64-mingw32) (122.52 kB)
#> ✔ Got askpass 1.2.0 (x86_64-w64-mingw32) (74.95 kB)
#> ✔ Got bsicons 0.1.2 (i386+x86_64-w64-mingw32) (258.33 kB)
#> ✔ Got config 0.3.2 (i386+x86_64-w64-mingw32) (111.40 kB)
#> ✔ Got akregulatoryaq 0.0.0.9000 (source) (579.06 kB)
#> ✔ Got anytime 0.3.9 (x86_64-w64-mingw32) (742.90 kB)
#> ✔ Got digest 0.6.37 (x86_64-w64-mingw32) (221.84 kB)
#> ✔ Got cli 3.6.3 (x86_64-w64-mingw32) (1.34 MB)
#> ✔ Got glue 1.7.0 (x86_64-w64-mingw32) (161.35 kB)
#> ✔ Got fansi 1.0.6 (x86_64-w64-mingw32) (314.08 kB)
#> ✔ Got here 1.0.1 (i386+x86_64-w64-mingw32) (64.14 kB)
#> ✔ Got generics 0.1.3 (i386+x86_64-w64-mingw32) (80.11 kB)
#> ✔ Got isoband 0.2.7 (x86_64-w64-mingw32) (1.97 MB)
#> ✔ Got Rcpp 1.0.13 (x86_64-w64-mingw32) (2.89 MB)
#> ✔ Got lazyeval 0.2.2 (x86_64-w64-mingw32) (161.18 kB)
#> ✔ Got htmlwidgets 1.6.4 (i386+x86_64-w64-mingw32) (812.25 kB)
#> ✔ Got magrittr 2.0.3 (x86_64-w64-mingw32) (226.88 kB)
#> ✔ Got munsell 0.5.1 (i386+x86_64-w64-mingw32) (245.49 kB)
#> ✔ Got purrr 1.0.2 (x86_64-w64-mingw32) (499.35 kB)
#> ✔ Got plotly 4.10.4 (i386+x86_64-w64-mingw32) (3.26 MB)
#> ✔ Got curl 5.2.2 (x86_64-w64-mingw32) (3.22 MB)
#> ✔ Got knitr 1.48 (i386+x86_64-w64-mingw32) (1.20 MB)
#> ✔ Got scales 1.3.0 (i386+x86_64-w64-mingw32) (703.21 kB)
#> ✔ Got sys 3.4.2 (x86_64-w64-mingw32) (47.08 kB)
#> ✔ Got rmarkdown 2.28 (i386+x86_64-w64-mingw32) (2.68 MB)
#> ✔ Got sourcetools 0.1.7-1 (x86_64-w64-mingw32) (383.96 kB)
#> ✔ Got tidyselect 1.2.1 (i386+x86_64-w64-mingw32) (225.08 kB)
#> ✔ Got utf8 1.2.4 (x86_64-w64-mingw32) (149.79 kB)
#> ✔ Got withr 3.0.1 (i386+x86_64-w64-mingw32) (227.49 kB)
#> ✔ Got crayon 1.5.3 (i386+x86_64-w64-mingw32) (163.65 kB)
#> ✔ Got openssl 2.2.1 (x86_64-w64-mingw32) (3.40 MB)
#> ✔ Got cachem 1.1.0 (x86_64-w64-mingw32) (72.50 kB)
#> ✔ Got desc 1.4.3 (i386+x86_64-w64-mingw32) (329.84 kB)
#> ✔ Got fs 1.6.4 (x86_64-w64-mingw32) (409.01 kB)
#> ✔ Got htmltools 0.5.8.1 (x86_64-w64-mingw32) (359.21 kB)
#> ✔ Got memoise 2.0.1 (i386+x86_64-w64-mingw32) (50.02 kB)
#> ✔ Got pkgbuild 1.4.4 (i386+x86_64-w64-mingw32) (202.58 kB)
#> ✔ Got jquerylib 0.1.4 (i386+x86_64-w64-mingw32) (526.00 kB)
#> ✔ Got processx 3.8.4 (x86_64-w64-mingw32) (686.67 kB)
#> ✔ Got farver 2.1.2 (x86_64-w64-mingw32) (1.51 MB)
#> ✔ Got rlang 1.1.4 (x86_64-w64-mingw32) (1.58 MB)
#> ✔ Got later 1.3.2 (x86_64-w64-mingw32) (464.25 kB)
#> ✔ Got golem 0.5.1 (i386+x86_64-w64-mingw32) (1.21 MB)
#> ✔ Got stringr 1.5.1 (i386+x86_64-w64-mingw32) (319.12 kB)
#> ✔ Got shinyWidgets 0.8.6 (i386+x86_64-w64-mingw32) (1.52 MB)
#> ✔ Got base64enc 0.1-3 (x86_64-w64-mingw32) (32.65 kB)
#> ✔ Got viridisLite 0.4.2 (i386+x86_64-w64-mingw32) (1.30 MB)
#> ✔ Got timechange 0.3.0 (x86_64-w64-mingw32) (507.47 kB)
#> ✔ Got commonmark 1.9.1 (x86_64-w64-mingw32) (142.43 kB)
#> ✔ Got fontawesome 0.5.2 (i386+x86_64-w64-mingw32) (1.36 MB)
#> ✔ Got gtable 0.3.5 (i386+x86_64-w64-mingw32) (225.73 kB)
#> ✔ Got lifecycle 1.0.4 (i386+x86_64-w64-mingw32) (139.67 kB)
#> ✔ Got dplyr 1.1.4 (x86_64-w64-mingw32) (1.56 MB)
#> ✔ Got pillar 1.9.0 (i386+x86_64-w64-mingw32) (659.46 kB)
#> ✔ Got ps 1.8.0 (x86_64-w64-mingw32) (637.33 kB)
#> ✔ Got httr 1.4.7 (i386+x86_64-w64-mingw32) (486.07 kB)
#> ✔ Got tibble 3.2.1 (x86_64-w64-mingw32) (690.81 kB)
#> ✔ Got vctrs 0.6.5 (x86_64-w64-mingw32) (1.34 MB)
#> ✔ Got httpuv 1.6.15 (x86_64-w64-mingw32) (1.04 MB)
#> ✔ Got sass 0.4.9 (x86_64-w64-mingw32) (2.61 MB)
#> ✔ Got data.table 1.16.0 (x86_64-w64-mingw32) (2.45 MB)
#> ✔ Got ggplot2 3.5.1 (i386+x86_64-w64-mingw32) (4.95 MB)
#> ✔ Got tinytex 0.53 (i386+x86_64-w64-mingw32) (141.73 kB)
#> ✔ Got pkgload 1.4.0 (i386+x86_64-w64-mingw32) (216.71 kB)
#> ✔ Got fastmap 1.2.0 (x86_64-w64-mingw32) (133.28 kB)
#> ✔ Got bslib 0.8.0 (i386+x86_64-w64-mingw32) (5.60 MB)
#> ✔ Got lubridate 1.9.3 (x86_64-w64-mingw32) (985.06 kB)
#> ✔ Got shiny 1.9.1 (i386+x86_64-w64-mingw32) (5.07 MB)
#> ✔ Got xtable 1.8-4 (i386+x86_64-w64-mingw32) (706.20 kB)
#> ✔ Got ggthemes 5.1.0 (i386+x86_64-w64-mingw32) (453.96 kB)
#> ✔ Got colorspace 2.1-1 (x86_64-w64-mingw32) (2.66 MB)
#> ✔ Got pkgconfig 2.0.3 (i386+x86_64-w64-mingw32) (22.48 kB)
#> ✔ Got jsonlite 1.8.8 (x86_64-w64-mingw32) (1.11 MB)
#> ✔ Got rappdirs 0.3.3 (x86_64-w64-mingw32) (51.46 kB)
#> ✔ Got mime 0.12 (x86_64-w64-mingw32) (40.83 kB)
#> ✔ Got labeling 0.4.3 (i386+x86_64-w64-mingw32) (62.57 kB)
#> ✔ Got crosstalk 1.2.1 (i386+x86_64-w64-mingw32) (413.19 kB)
#> ✔ Got rprojroot 2.0.4 (i386+x86_64-w64-mingw32) (113.71 kB)
#> ✔ Got highr 0.11 (i386+x86_64-w64-mingw32) (44.03 kB)
#> ✔ Got tidyr 1.3.1 (x86_64-w64-mingw32) (1.27 MB)
#> ✔ Got evaluate 1.0.0 (i386+x86_64-w64-mingw32) (101.50 kB)
#> ✔ Got xfun 0.47 (x86_64-w64-mingw32) (534.60 kB)
#> ✔ Installed R6 2.5.1  (448ms)
#> ✔ Installed RColorBrewer 1.1-3  (555ms)
#> ✔ Installed anytime 0.3.9  (633ms)
#> ✔ Installed askpass 1.2.0  (761ms)
#> ✔ Installed attempt 0.3.1  (823ms)
#> ✔ Installed base64enc 0.1-3  (898ms)
#> ✔ Installed bsicons 0.1.2  (964ms)
#> ✔ Installed cachem 1.1.0  (1s)
#> ✔ Installed callr 3.7.6  (1.1s)
#> ✔ Installed cli 3.6.3  (1.1s)
#> ✔ Installed commonmark 1.9.1  (1.2s)
#> ✔ Installed config 0.3.2  (1.3s)
#> ✔ Installed crayon 1.5.3  (1.3s)
#> ✔ Installed curl 5.2.2  (1.4s)
#> ✔ Installed desc 1.4.3  (1.5s)
#> ✔ Installed crosstalk 1.2.1  (1.6s)
#> ✔ Installed colorspace 2.1-1  (1.8s)
#> ✔ Installed data.table 1.16.0  (1.7s)
#> ✔ Installed Rcpp 1.0.13  (2s)
#> ✔ Installed digest 0.6.37  (760ms)
#> ✔ Installed bslib 0.8.0  (2.1s)
#> ✔ Installed dplyr 1.1.4  (829ms)
#> ✔ Installed evaluate 1.0.0  (795ms)
#> ✔ Installed fansi 1.0.6  (759ms)
#> ✔ Installed farver 2.1.2  (804ms)
#> ✔ Installed fastmap 1.2.0  (807ms)
#> ✔ Installed fontawesome 0.5.2  (827ms)
#> ✔ Installed fs 1.6.4  (852ms)
#> ✔ Installed generics 0.1.3  (900ms)
#> ✔ Installed ggplot2 3.5.1  (1s)
#> ✔ Installed ggthemes 5.1.0  (1s)
#> ✔ Installed glue 1.7.0  (992ms)
#> ✔ Installed gtable 0.3.5  (970ms)
#> ✔ Installed golem 0.5.1  (1s)
#> ✔ Installed here 1.0.1  (985ms)
#> ✔ Installed highr 0.11  (1.1s)
#> ✔ Installed htmltools 0.5.8.1  (1.1s)
#> ✔ Installed htmlwidgets 1.6.4  (1.1s)
#> ✔ Installed httpuv 1.6.15  (1.1s)
#> ✔ Installed httr 1.4.7  (1.1s)
#> ✔ Installed isoband 0.2.7  (1.2s)
#> ✔ Installed jquerylib 0.1.4  (1.2s)
#> ✔ Installed jsonlite 1.8.8  (1.2s)
#> ✔ Installed labeling 0.4.3  (1.2s)
#> ✔ Installed knitr 1.48  (1.3s)
#> ✔ Installed later 1.3.2  (1.3s)
#> ✔ Installed lazyeval 0.2.2  (1.3s)
#> ✔ Installed lifecycle 1.0.4  (1.3s)
#> ✔ Installed lubridate 1.9.3  (1.3s)
#> ✔ Installed magrittr 2.0.3  (1.4s)
#> ✔ Installed memoise 2.0.1  (1.4s)
#> ✔ Installed mime 0.12  (1.4s)
#> ✔ Installed munsell 0.5.1  (1.5s)
#> ✔ Installed openssl 2.2.1  (1.5s)
#> ✔ Installed pillar 1.9.0  (1.6s)
#> ✔ Installed pkgbuild 1.4.4  (1.6s)
#> ✔ Installed pkgconfig 2.0.3  (1.6s)
#> ✔ Installed pkgload 1.4.0  (1.6s)
#> ✔ Installed processx 3.8.4  (1.6s)
#> ✔ Installed promises 1.3.0  (1.6s)
#> ✔ Installed plotly 4.10.4  (1.8s)
#> ✔ Installed ps 1.8.0  (1.6s)
#> ✔ Installed purrr 1.0.2  (1.5s)
#> ✔ Installed rappdirs 0.3.3  (1.6s)
#> ✔ Installed rlang 1.1.4  (1.6s)
#> ✔ Installed rprojroot 2.0.4  (1.5s)
#> ✔ Installed sass 0.4.9  (1.5s)
#> ✔ Installed rmarkdown 2.28  (1.7s)
#> ✔ Installed scales 1.3.0  (1.5s)
#> ✔ Installed sourcetools 0.1.7-1  (1.8s)
#> ✔ Installed stringr 1.5.1  (1.6s)
#> ✔ Installed shinyWidgets 0.8.6  (2.1s)
#> ✔ Installed shiny 1.9.1  (2s)
#> ✔ Installed sys 3.4.2  (1.7s)
#> ✔ Installed stringi 1.8.4  (1.9s)
#> ✔ Installed tibble 3.2.1  (1.7s)
#> ✔ Installed tidyr 1.3.1  (1.6s)
#> ✔ Installed tidyselect 1.2.1  (1.6s)
#> ✔ Installed timechange 0.3.0  (1.5s)
#> ✔ Installed tinytex 0.53  (1.5s)
#> ✔ Installed utf8 1.2.4  (1.5s)
#> ✔ Installed vctrs 0.6.5  (1.5s)
#> ✔ Installed viridisLite 0.4.2  (1.4s)
#> ✔ Installed withr 3.0.1  (1.4s)
#> ✔ Installed xfun 0.47  (1.4s)
#> ✔ Installed xtable 1.8-4  (1.3s)
#> ✔ Installed yaml 2.3.10  (1.3s)
#> ℹ Packaging akregulatoryaq 0.0.0.9000
#> ✔ Packaged akregulatoryaq 0.0.0.9000 (479ms)
#> ℹ Building akregulatoryaq 0.0.0.9000
#> ✔ Built akregulatoryaq 0.0.0.9000 (4.6s)
#> ✔ Installed akregulatoryaq 0.0.0.9000 (github::simeon-s-ng/akregulatoryaq@c3922c0) (69ms)
#> ✔ 1 pkg + 92 deps: kept 3, upd 1, added 87, dld 84 (NA B) [50.5s]
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
#> [1] "2024-09-18 13:32:26 AKDT"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading akregulatoryaq
#> ── R CMD check results ────────────────────────── akregulatoryaq 0.0.0.9000 ────
#> Duration: 49.5s
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
