
# covid19france

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Covid19R/covid19france.svg?branch=master)](https://travis-ci.org/Covid19R/covid19france)
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
country
#> # A tibble: 97 x 8
#>    date       region_name region_code confirmed  dead   icu hospitalized
#>    <date>     <chr>       <chr>           <dbl> <dbl> <dbl>        <dbl>
#>  1 2020-01-24 France      FRA                 3     0    NA            3
#>  2 2020-01-24 France      FRA                 3     0    NA            3
#>  3 2020-01-25 France      FRA                 3    NA    NA           NA
#>  4 2020-01-26 France      FRA                 3    NA    NA           NA
#>  5 2020-01-27 France      FRA                 3     0    NA           NA
#>  6 2020-01-27 France      FRA                 3     0     0            3
#>  7 2020-01-28 France      FRA                 4     0    NA            4
#>  8 2020-01-28 France      FRA                 4     0     1            4
#>  9 2020-01-29 France      FRA                 5     0    NA            5
#> 10 2020-01-29 France      FRA                 5     0     2            5
#> # … with 87 more rows, and 1 more variable: recovered <dbl>
```

``` r
regional
#> # A tibble: 2,292 x 8
#>    date       region_name region_code confirmed  dead   icu hospitalized
#>    <date>     <chr>       <chr>           <dbl> <dbl> <dbl>        <dbl>
#>  1 2020-01-24 Charente    DEP-16              0    NA    NA           NA
#>  2 2020-01-24 Charente-M… DEP-17              0    NA    NA           NA
#>  3 2020-01-24 Corrèze     DEP-19              0    NA    NA           NA
#>  4 2020-01-24 Creuse      DEP-23              0    NA    NA           NA
#>  5 2020-01-24 Dordogne    DEP-24              0    NA    NA           NA
#>  6 2020-01-24 Gironde     DEP-33              1    NA    NA           NA
#>  7 2020-01-24 Gironde     DEP-33              1    NA    NA            1
#>  8 2020-01-24 Landes      DEP-40              0    NA    NA           NA
#>  9 2020-01-24 Lot-et-Gar… DEP-47              0    NA    NA           NA
#> 10 2020-01-24 Pyrénées-A… DEP-64              0    NA    NA           NA
#> # … with 2,282 more rows, and 1 more variable: recovered <dbl>
```
