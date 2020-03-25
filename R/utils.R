#' @import dplyr
#' @import readr

url <- "https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv"

todays_date <- lubridate::today()

download_dir <- here::here("data-raw")

create_path <- function(dte = todays_date,
                                 type = "raw",
                                 suffix = "") {
  glue::glue("{download_dir}/{dte}_france_{type}_{suffix}.csv")
}

download_path <- create_path()

download_data <- function(verbose = FALSE) {
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

clean_data <- function() {
  if (! download_successful()) {
    return(tibble())
  }

  raw <- read_csv(
    download_path,
    col_types =
      cols(
        date = col_date(format = ""),
        granularite = col_character(),
        maille_code = col_character(),
        maille_nom = col_character(),
        cas_confirmes = col_double(),
        deces = col_double(),
        reanimation = col_double(),
        hospitalises = col_double(),
        gueris = col_double(),
        source_nom = col_character(),
        source_url = col_character(),
        source_type = col_character()
      )
  )

  raw %>%
    select(
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
    arrange(
      desc(date),
      region_name
    )
}

average_data <- function(tbl) {
  tbl %>%
    group_by(
      date,
      region_name,
      region_code
    ) %>%
    summarise_if(
      is.numeric,
      mean, na.rm = TRUE
    ) %>%
    ungroup()
}

save_country <- function(tbl) {
  france_country_all_sources <-
    tbl %>%
    filter(region_type == "pays") %>%
    select(-region_type)

  write_csv(
    france_country_all_sources,
    create_path(type = "clean", suffix = "country_all_sources")
  )

  france_country <-
    france_country_all_sources %>%
    average_data()

  write_csv(
    france_country,
    create_path(type = "clean", suffix = "country")
  )

  usethis::use_data(france_country)
}

save_regional <- function(tbl) {
  france_regional_all_sources <-
    tbl %>%
    filter(region_type == "departement") %>%
    select(-region_type)

  write_csv(
    france_regional_all_sources,
    create_path(type = "clean", suffix = "regional_all_sources")
  )

  france_regional <-
    france_regional_all_sources %>%
    average_data()

  write_csv(
    france_regional,
    create_path(type = "clean", suffix = "regional")
  )

  usethis::use_data(france_regional)
}
