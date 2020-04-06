#' Refresh data
#'
#' @param verbose Should messages about what's going on be displayed?
#'
#' @return Get the most up to do date per-day data
#' @export
#'
#' @examples
#' \donttest{
#' refresh_covid19france()
#' }
refresh_covid19france <- function(verbose = TRUE) {
  if (verbose) message(glue::glue("Downloading raw data from {url}."))
  download_data()

  read_data() %>%
    clean_data() %>%
    average_data() %>%
    enlongen_data()
}
