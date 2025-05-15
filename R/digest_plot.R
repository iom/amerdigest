
#' Generate a preset plot
#'
#' @param key Plot key.
#' @param iso Country.
#' @param basesize Base text size. Default is 7.
#' @param font Font family. Default is Open Sans.
#' @param ... Optional arguments.
#'
#' @description If `iso=NULL`, function returns `key` plot's metadata.
#'
#' @returns `ggplot2` object or a list of metadata.
#'
#' @export
digest_plot <- function(key,
                        iso = NULL,
                        basesize = basesize,
                        font = font,
                        ...) {

  plotter_name <- paste0("plot_", key)

  if (exists(plotter_name, envir = asNamespace("amerdigest"), inherits = FALSE)) {

    if (!is.null(iso)) {

      if (iso %in% countrynames$iso3) {

        plotter <- get(paste0("plot_", key), envir = asNamespace("amerdigest"))
        return(plotter(iso, basesize, font, ...))

      } else cli::cli_abort("{iso} is not a valid ISO3 code.")

    } else cli::cli_abort("`iso` missing. Choose a country to plot.")

  } else cli::cli_abort("{key} is not a valid plot key.")

}
