
library(tidyverse)
library(tsibble)

process_data <- function(file) {

  readxl::read_excel(str_glue("data-raw/{file}"), na = c("-", NA)) |>

    # Remove year aggregates
    filter(!is.na(month)) |>

    rename(
      geo = ISO3_country_destination,
      nat = ISO3_country_origin,
      n = value
    ) |>
    mutate(
      t = yearmonth(paste0(year, "-", month)),
      nat = ifelse(is.na(nat), "OOO", nat)
    ) |>
    summarise(n = sum(n), .by = c(t, geo, nat))
}

regin <- process_data("consolidated_reg_entries.xlsx")
regout <- process_data("consolidated_reg_exits.xlsx")
irreg <- process_data("consolidated_irreg_entries.xlsx")

usethis::use_data(regin, overwrite = TRUE)
usethis::use_data(regout, overwrite = TRUE)
usethis::use_data(irreg, overwrite = TRUE)
