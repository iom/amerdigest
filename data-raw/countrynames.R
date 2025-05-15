
countrynames <- readxl::read_excel("data-raw/countrynames.xlsx")
usethis::use_data(countrynames, overwrite = TRUE)

