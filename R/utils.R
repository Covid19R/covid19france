#' @importFrom utils download.file

url <- "https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv"

todays_date <- lubridate::today()

download_dir <- here::here("data-raw")

create_path <- function(dte = todays_date,
                        type = "raw",
                        suffix = "") {
  glue::glue("{download_dir}/{dte}_france_{type}{suffix}.csv")
}

download_path <- create_path()

download_data <- function(verbose = FALSE) {
  if (!fs::dir_exists(download_dir)) {
    fs::dir_create(download_dir)
  }

  download.file(url, download_path, quiet = !verbose)
}

extract_dates <- function(vec) {
  vec %>%
    stringr::str_remove(".*/") %>%
    stringr::str_remove_all("[^0-9]") %>%
    lubridate::ymd()
}

download_successful <- function(dte = todays_date) {
  fls <- fs::dir_ls(download_dir)

  existing_dates <-
    fls %>%
    extract_dates()

  if (todays_date %in% existing_dates) TRUE else FALSE
}

read_data <- function() {
  if (!download_successful()) {
    message("Raw download from {url} was not successful.")
    return(dplyr::tibble())
  }

  raw <- readr::read_csv(
    download_path,
    col_types =
      readr::cols(
        date = readr::col_date(format = ""),
        granularite = readr::col_character(),
        maille_code = readr::col_character(),
        maille_nom = readr::col_character(),
        cas_confirmes = readr::col_integer(),
        deces = readr::col_integer(),
        reanimation = readr::col_integer(),
        hospitalises = readr::col_integer(),
        gueris = readr::col_integer(),
        source_nom = readr::col_character(),
        source_url = readr::col_character(),
        source_type = readr::col_character()
      )
  )
}

clean_data <- function(tbl) {
  tbl %>%
    dplyr::select(
      date,
      region_type = granularite,
      region_name = maille_nom,
      region_code = maille_code,
      confirmed = cas_confirmes,
      dead = deces,
      icu = reanimation,
      hospitalized = hospitalises,
      recovered = gueris,
      source_url,
      source_type
    ) %>%
    dplyr::arrange(
      desc(date),
      region_name
    ) %>%
    dplyr::mutate_if(
      is.character,
      stringr::str_squish
    )
}

average_data <- function(tbl) {
  tbl %<>%
    dplyr::group_by(
      date,
      region_name,
      region_code
    ) %>%
    dplyr::summarise_if(
      is.numeric,
      mean,
      na.rm = TRUE
    ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      desc(date),
      region_name
    ) %>%
    # Replace NaNs with NA
    tidyr::replace_na(
      list(
        dead = NA,
        icu = NA,
        hospitalized = NA,
        recovered = NA
      )
    )
}

save_country <- function(tbl) {
  france_country_all_sources <-
    tbl %>%
    dplyr::filter(region_type == "pays") %>%
    dplyr::select(-region_type)

  readr::write_csv(
    france_country_all_sources,
    create_path(type = "clean", suffix = "_country_all_sources")
  )

  france_country <-
    france_country_all_sources %>%
    average_data()

  readr::write_csv(
    france_country,
    create_path(type = "clean", suffix = "_country")
  )

  usethis::use_data(france_country, overwrite = TRUE)
}

save_regional <- function(tbl) {
  france_regional_all_sources <-
    tbl %>%
    dplyr::filter(region_type == "departement") %>%
    dplyr::select(-region_type)

  readr::write_csv(
    france_regional_all_sources,
    create_path(type = "clean", suffix = "_regional_all_sources")
  )

  france_regional <-
    france_regional_all_sources %>%
    average_data()

  readr::write_csv(
    france_regional,
    create_path(type = "clean", suffix = "_regional")
  )

  usethis::use_data(france_regional, overwrite = TRUE)
}
