
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
france_country
#>          date region_name region_code confirmed      dead      icu hospitalized
#> 1  2020-03-24      France         FRA   22301.0 1100.0000 2516.000    10176.000
#> 2  2020-03-23      France         FRA   19856.0  860.0000 2081.333     8674.333
#> 3  2020-03-22      France         FRA   16689.0  660.0000 1722.000     7144.667
#> 4  2020-03-21      France         FRA   14459.0  549.6667 1501.000     6081.333
#> 5  2020-03-20      France         FRA   12612.0  450.0000 1297.000     5226.000
#> 6  2020-03-19      France         FRA   10995.0  357.0000 1062.000     4267.000
#> 7  2020-03-18      France         FRA    9134.0  242.0000  851.000     3299.000
#> 8  2020-03-17      France         FRA    7730.0  175.0000  699.000     2579.000
#> 9  2020-03-16      France         FRA    6633.0  148.0000       NA           NA
#> 10 2020-03-15      France         FRA    5423.0  127.0000       NA      400.000
#> 11 2020-03-14      France         FRA    4499.5   91.0000  300.000           NA
#> 12 2020-03-13      France         FRA    3661.0   79.0000       NA           NA
#>    recovered
#> 1     3281.0
#> 2     2567.0
#> 3     2158.5
#> 4     1811.0
#> 5     1587.0
#> 6     1240.0
#> 7      908.0
#> 8      602.0
#> 9         NA
#> 10        NA
#> 11        NA
#> 12        NA
#>  [ reached 'max' / getOption("max.print") -- omitted 44 rows ]
```

``` r
france_regional
#>          date   region_name region_code confirmed dead icu hospitalized
#> 1  2020-03-24         Aisne      DEP-02       NaN   24  NA           NA
#> 2  2020-03-24        Allier      DEP-03        34   NA  NA           NA
#> 3  2020-03-24       Ardèche      DEP-07       125   NA  NA           NA
#> 4  2020-03-24      Calvados      DEP-14       147   NA  NA           25
#> 5  2020-03-24        Cantal      DEP-15        31   NA  NA           NA
#> 6  2020-03-24          Cher      DEP-18        20    0  NA           NA
#> 7  2020-03-24  Corse-du-Sud      DEP-2A       175   11   8           38
#> 8  2020-03-24 Côtes-d'Armor      DEP-22        38   NA  NA           NA
#> 9  2020-03-24         Drôme      DEP-26       113   NA  NA           NA
#> 10 2020-03-24          Eure      DEP-27        71   NA  NA           15
#> 11 2020-03-24  Eure-et-Loir      DEP-28        87    3  NA           NA
#> 12 2020-03-24     Finistère      DEP-29       127   NA  NA           NA
#>    recovered
#> 1         NA
#> 2         NA
#> 3         NA
#> 4         NA
#> 5         NA
#> 6         NA
#> 7         NA
#> 8         NA
#> 9         NA
#> 10        NA
#> 11        NA
#> 12        NA
#>  [ reached 'max' / getOption("max.print") -- omitted 1793 rows ]
```
