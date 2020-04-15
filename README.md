
# covid19france

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Covid19R/covid19france.svg?branch=master)](https://travis-ci.org/Covid19R/covid19france)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/covid19france)](https://CRAN.R-project.org/package=covid19france)
<!-- badges: end -->

This package provides per-day data on COVID-19 cases in France.

The data is an average over all of the sources provided by
[opencovid19-fr](https://github.com/opencovid19-fr/data). (README in
English available
[here](https://github.com/opencovid19-fr/data/blob/master/README.en.md).)

## Installation

From CRAN:

``` r
install.packages("covid19france")
```

or the development version:

``` r
# install.packages("devtools")
devtools::install_github("Covid19R/covid19france")
```

## Data

``` r
library(covid19france)
```

Get the full dataset:

``` r
(france <- refresh_covid19france())
#> Downloading raw data from https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv.
#> # A tibble: 30,090 x 7
#>    date       location location_type location_standa… location_standa… data_type
#>    <date>     <chr>    <chr>         <chr>            <chr>            <chr>    
#>  1 2020-04-14 Ain      county        DEP-01           department       confirmed
#>  2 2020-04-14 Ain      county        DEP-01           department       dead     
#>  3 2020-04-14 Ain      county        DEP-01           department       icu      
#>  4 2020-04-14 Ain      county        DEP-01           department       hospital…
#>  5 2020-04-14 Ain      county        DEP-01           department       recovered
#>  6 2020-04-14 Ain      county        DEP-01           department       discover…
#>  7 2020-04-14 Aisne    county        DEP-02           department       confirmed
#>  8 2020-04-14 Aisne    county        DEP-02           department       dead     
#>  9 2020-04-14 Aisne    county        DEP-02           department       icu      
#> 10 2020-04-14 Aisne    county        DEP-02           department       hospital…
#> # … with 30,080 more rows, and 1 more variable: value <int>
```

To switch to a wider format, you can use `tidyr`:

``` r
france %>% 
  tidyr::pivot_wider(
    names_from = "data_type"
  ) %>% 
  dplyr::select(
    1, 6:ncol(.), everything()
  )
#> # A tibble: 5,015 x 11
#>    date       confirmed  dead   icu hospitalized recovered discovered location
#>    <date>         <int> <int> <int>        <int>     <int>      <int> <chr>   
#>  1 2020-04-14        NA    46    29          134       144         NA Ain     
#>  2 2020-04-14        NA   152    45          279       296         NA Aisne   
#>  3 2020-04-14        NA    16    21           62        81         NA Allier  
#>  4 2020-04-14        NA     5     4           34        71         NA Alpes-d…
#>  5 2020-04-14        NA    81    79          282       270         NA Alpes-M…
#>  6 2020-04-14        NA    45    24          106       193         NA Ardèche 
#>  7 2020-04-14        NA    21    17           78        71         NA Ardennes
#>  8 2020-04-14        NA     1     4           16        15         NA Ariège  
#>  9 2020-04-14        NA    65    26          274       198         NA Aube    
#> 10 2020-04-14        NA    41    12           86        98         NA Aude    
#> # … with 5,005 more rows, and 3 more variables: location_type <chr>,
#> #   location_standardized <chr>, location_standardized_type <chr>
```

For more info on the dataset:

``` r
get_info_covid19france()
#> # A tibble: 1 x 10
#>   data_set_name package_name function_to_get… data_details data_url license_url
#>   <chr>         <chr>        <chr>            <chr>        <chr>    <chr>      
#> 1 covid19france covid19fran… refresh_covid19… Open Source… https:/… https://gi…
#> # … with 4 more variables: data_types <chr>, location_types <chr>,
#> #   spatial_extent <chr>, has_geospatial_info <lgl>
```

## Contributing

Please submit [issues](https://github.com/Covid19R/covid19france/issues)
and [pull requests](https://github.com/Covid19R/covid19france/pulls)
with any package improvements\!

Please note that the ‘covid19france’ project is released with a
[Contributor Code of
Conduct](https://github.com/Covid19R/covid19france/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
