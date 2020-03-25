raw_cols <-
  c(
    "date",
    "granularite",
    "maille_code",
    "maille_nom",
    "cas_confirmes",
    "deces",
    "reanimation",
    "hospitalises",
    "gueris",
    "depistes",
    "source_nom",
    "source_url",
    "source_type"
  )

test_that("original cols remain the same", {

  download_data()

  expect_true(download_successful())

  raw <- readr::read_csv(
    download_path
  )

  expect_named(raw, raw_cols)
})


test_that("cleaning and averaging", {

  clean <-
    read_data() %>%
    clean_data()

  avg <-
    clean %>%
    average_data()

  expect_gte(nrow(avg), 50)
})
