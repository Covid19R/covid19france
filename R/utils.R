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

download_data <- function() {
  if (!fs::dir_exists(download_dir)) {
    fs::dir_create(download_dir)
  }

  download.file(url, download_path, quiet = TRUE)
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
        depistes = readr::col_integer(),
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
      discovered = depistes,
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

round_mean <- function(...) {
  mean(..., na.rm = TRUE) %>%
    round() %>%
    as.integer()
}

average_data <- function(tbl) {
  tbl %>%
    dplyr::group_by(
      date,
      region_name,
      region_code,
      region_type
    ) %>%
    dplyr::summarise_if(
      is.numeric,
      round_mean
    ) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(
      desc(date),
      region_name
    )
}

enlongen_data <- function(tbl) {
  tbl %<>%
    dplyr::mutate(
      location_type =
        dplyr::case_when(
          region_type == "departement" ~ "county",
          region_type == "pays" ~ "country",
          region_type == "collectivite-outremer" ~ "overseas collectivity",
          TRUE ~ region_type
        ),
      location_standardized_type = "department"
    ) %>%
    tidyr::pivot_longer(
      confirmed:discovered,
      names_to = "data_type",
      values_to = "value"
    ) %>%
    dplyr::select(
      date,
      location = region_name,
      location_type,
      location_standardized = region_code,
      location_standardized_type,
      data_type,
      value
    )

  # Filter out world counts
  if ("monde" %in% unique(tbl$location_type)) {
    tbl %<>%
      dplyr::filter(
        !location_type == "monde"
      )
  }

  tbl %>%
    dplyr::distinct()
}
