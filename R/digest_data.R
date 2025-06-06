# WARNING - Generated by {fusen} from dev/flat_my_fun.Rmd: do not edit by hand # nolint: line_length_linter.

#' Retrieve Data for Plotting by Key and Country ISO Code
#'
#' This function dynamically calls a getter function from the `amerdigest` package
#' based on the provided `key`. Optionally, it filters data by the ISO3 country code.
#'
#' @param key Character. The data key to specify which getter function to call.
#'   Must correspond to a function named `get_<key>` inside the `amerdigest` package.
#' @param iso Character or NULL. Optional ISO3 country code to filter data by country.
#'   If provided, must exist in `countrynames$iso3`.
#' @param ... Additional arguments passed to the underlying getter function.
#'
#' @return A list (or object) returned by the called getter function.
#'
#' @importFrom cli cli_abort
#' @export
#' @examples
#' # Example usage assuming amerdigest and countrynames are loaded
#' data <- digest_data("regflow", iso = "USA")
#' knitr::kable(data)

digest_data <- function(key, iso = NULL, ...) {
  # Construct function name
  fxn_name <- paste0("get_", key)

  # Check if function exists in amerdigest namespace
  if (exists(fxn_name, envir = asNamespace("amerdigest"), inherits = FALSE)) {

    # Validate ISO3 code if provided
    if (!is.null(iso)) {
      if (!(iso %in% countrynames$iso3)) {
        cli::cli_abort("{.val {iso}} is not a valid ISO3 code.")
      }
    }

    # Retrieve getter function
    getter <- get(fxn_name, envir = asNamespace("amerdigest"))

    # Call getter function with iso and additional arguments
    return(getter(iso, ...))

  } else {

    cli::cli_abort("{.val {key}} is not a valid getter key.")
  }
}
