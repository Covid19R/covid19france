#' Refresh raw and cleaned data
#'
#' @param verbose Should messages about what's going on be displayed?
#'
#' @return Update the raw and cleaned country and regional CSVs of data in \code{data-raw}.
#' @export
#'
#' @examples
#' \dontrun{
#' refresh()
#' }
refresh <- function(verbose = TRUE) {
  message(glue::glue("Downloading raw data from {url}."))
  download_data(verbose = FALSE)

  clean <-
    read_data() %>%
    clean_data()

  message("Saving clean data.")
  save_country(clean)
  save_regional(clean)
}
