
# covid19france

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Covid19R/covid19france.svg?branch=master)](https://travis-ci.org/Covid19R/covid19france)
[![CRAN
status](https://www.r-pkg.org/badges/version/covid19us)](https://CRAN.R-project.org/package=covid19us)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

## Installation

``` r
# install.packages("devtools")
devtools::install_github("Covid19R/covid19france")
```

## Example

``` r
library(covid19france)
```

``` r
tibble::tibble(france_country)
#> # A tibble: 56 x 1
#>    france_country$… $region_name $region_code $confirmed $dead  $icu
#>    <date>           <chr>        <chr>             <dbl> <dbl> <dbl>
#>  1 2020-03-24       France       FRA               22301 1100  2516 
#>  2 2020-03-23       France       FRA               19856  860  2081.
#>  3 2020-03-22       France       FRA               16689  660  1722 
#>  4 2020-03-21       France       FRA               14459  550. 1501 
#>  5 2020-03-20       France       FRA               12612  450  1297 
#>  6 2020-03-19       France       FRA               10995  357  1062 
#>  7 2020-03-18       France       FRA                9134  242   851 
#>  8 2020-03-17       France       FRA                7730  175   699 
#>  9 2020-03-16       France       FRA                6633  148    NA 
#> 10 2020-03-15       France       FRA                5423  127    NA 
#> # … with 46 more rows, and 2 more variables: $hospitalized <dbl>,
#> #   $recovered <dbl>
```

``` r
tibble::tibble(france_regional)
#> # A tibble: 1,805 x 1
#>    france_regional… $region_name $region_code $confirmed $dead  $icu
#>    <date>           <chr>        <chr>             <dbl> <dbl> <dbl>
#>  1 2020-03-24       Aisne        DEP-02              NaN    24    NA
#>  2 2020-03-24       Allier       DEP-03               34    NA    NA
#>  3 2020-03-24       Ardèche      DEP-07              125    NA    NA
#>  4 2020-03-24       Calvados     DEP-14              147    NA    NA
#>  5 2020-03-24       Cantal       DEP-15               31    NA    NA
#>  6 2020-03-24       Cher         DEP-18               20     0    NA
#>  7 2020-03-24       Corse-du-Sud DEP-2A              175    11     8
#>  8 2020-03-24       Côtes-d'Arm… DEP-22               38    NA    NA
#>  9 2020-03-24       Drôme        DEP-26              113    NA    NA
#> 10 2020-03-24       Eure         DEP-27               71    NA    NA
#> # … with 1,795 more rows, and 2 more variables: $hospitalized <dbl>,
#> #   $recovered <dbl>
```

``` r
refresh()
#> Downloading raw data from https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv.
#> Saving clean data.
#> ✔ Setting active project to '/Users/amanda/Desktop/Projects/covid19france'
#> ✔ Saving 'france_country' to 'data/france_country.rda'
#> ✔ Saving 'france_regional' to 'data/france_regional.rda'
```
