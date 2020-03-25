#' Averages of COVID-19 cases in the country of France
#'
#' One row per day summarizing the data in \code{data-raw/<date>_france_clean_country.csv}. Averages over all the sources are computed per day.
#'
#' @format A data frame with one row per date and 8 variables:
#' \describe{
#'   \item{date}{Date}
#'   \item{region_name}{France}
#'   \item{region_code}{FRA}
#'   \item{confirmed}{Number of cumulative confirmed cases on this day.}
#'   \item{dead}{Number of cumulative dead cases on this day.}
#'   \item{icu}{Number of cumulative icu cases on this day.}
#'   \item{hospitalized}{Number of cumulative hospitalized cases on this day.}
#'   \item{recovered}{Number of cumulative dead recovered on this day.}
#' }
#' @source \url{https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv}
"france_country"

#' Averages of COVID-19 cases per region in France
#'
#' One row per day summarizing the data in \code{data-raw/<date>_france_clean_regional.csv}. Averages over all the sources are computed per region per day.
#'
#' @format A data frame with one row per date and 8 variables:
#' \describe{
#'   \item{date}{Date}
#'   \item{region_name}{France}
#'   \item{region_code}{FRA}
#'   \item{confirmed}{Number of cumulative confirmed cases on this day.}
#'   \item{dead}{Number of cumulative dead cases on this day.}
#'   \item{icu}{Number of cumulative icu cases on this day.}
#'   \item{hospitalized}{Number of cumulative hospitalized cases on this day.}
#'   \item{recovered}{Number of cumulative dead recovered on this day.}
#' }
#' @source \url{https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv}
"france_regional"
