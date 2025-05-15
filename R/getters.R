
# Functions for prepping data for charts

get_regflow <- function(iso = NULL) {

  data <- bind_rows(
    regin |>
      summarise(n = sum(n), .by = c(geo, t)) |>
      mutate(var = "Entries"),
    regout |>
      summarise(n = sum(n), .by = c(geo, t)) |>
      mutate(var = "Exits"),
  )

  data_iso <- filter(data, geo == iso)

  if (is.null(iso)) {
    return(data)
  } else {
    return(data_iso)
  }
}

get_regnet <- function(iso = NULL) {

  data <- full_join(
    regin |>
      summarise(n_in = sum(n), .by = c(geo, t)),
    regout |>
      summarise(n_out = sum(n), .by = c(geo, t)),
    by = c("t", "geo")
  ) |>
    drop_na() |>
    mutate(n = n_in - n_out)

  data_iso <- filter(data, geo == iso)

  if (is.null(iso)) {
    return(data)
  } else {
    return(data_iso)
  }
}
