
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
france_country
#> # A tibble: 56 x 8
#>    date       region_name region_code confirmed  dead   icu hospitalized
#>    <date>     <chr>       <chr>           <dbl> <dbl> <dbl>        <dbl>
#>  1 2020-01-24 France      FRA                 3     0   NaN            3
#>  2 2020-01-25 France      FRA                 3   NaN   NaN          NaN
#>  3 2020-01-26 France      FRA                 3   NaN   NaN          NaN
#>  4 2020-01-27 France      FRA                 3     0     0            3
#>  5 2020-01-28 France      FRA                 4     0     1            4
#>  6 2020-01-29 France      FRA                 5     0     2            5
#>  7 2020-01-30 France      FRA                 6     0     2            6
#>  8 2020-01-31 France      FRA                 6     0     2            6
#>  9 2020-02-02 France      FRA                 6     0     1            6
#> 10 2020-02-03 France      FRA                 6     0     1            6
#> # … with 46 more rows, and 1 more variable: recovered <dbl>
```

``` r
france_regional
#> # A tibble: 1,800 x 8
#>    date       region_name region_code confirmed  dead   icu hospitalized
#>    <date>     <chr>       <chr>           <dbl> <dbl> <dbl>        <dbl>
#>  1 2020-01-24 Charente    DEP-16              0   NaN   NaN          NaN
#>  2 2020-01-24 Charente-M… DEP-17              0   NaN   NaN          NaN
#>  3 2020-01-24 Corrèze     DEP-19              0   NaN   NaN          NaN
#>  4 2020-01-24 Creuse      DEP-23              0   NaN   NaN          NaN
#>  5 2020-01-24 Deux-Sèvres DEP-79              0   NaN   NaN          NaN
#>  6 2020-01-24 Dordogne    DEP-24              0   NaN   NaN          NaN
#>  7 2020-01-24 Gironde     DEP-33              1   NaN   NaN            1
#>  8 2020-01-24 Haute-Vien… DEP-87              0   NaN   NaN          NaN
#>  9 2020-01-24 Landes      DEP-40              0   NaN   NaN          NaN
#> 10 2020-01-24 Lot-et-Gar… DEP-47              0   NaN   NaN          NaN
#> # … with 1,790 more rows, and 1 more variable: recovered <dbl>
```
