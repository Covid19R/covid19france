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
    "depistes"
  )

test_that("original cols we care about are still there", {

  download_data()

  expect_true(download_successful())

  raw <- readr::read_csv(
    download_path
  )

  expect_length(
    setdiff(raw_cols, names(raw)),
    0L
  )
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
