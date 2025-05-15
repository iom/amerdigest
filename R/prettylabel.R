#' Pretty number formatting
#'
#' @description Formats numbers for display in charts.
#'
#' @param N Number or vector of numbers to be formatted.
#' @param signif Number of significant digits.
#' @param shorten Whether to abbreviate long numbers.
#' @param spell Whether to spell out "millions", "billions", and "trillions".
#' @param padzero Whether to include zeros after the decimal point.
#' @param pct Whether to include a percent sign.
#' @param currency Whether to add a currency sign.
#'
#' @return String or vector of strings.
#'
#' @export
prettylabel <- function(N,
                        signif = 2,
                        spell = FALSE,
                        padzero = FALSE,
                        pct = FALSE,
                        currency = NULL) {

  if (signif <= 0) {
    cli::cli_abort("`signif` must be greater than zero.")
  }

  fmt <- function(num) {

    parts <- strsplit(as.character(num), "\\.")[[1]]
    units <- nchar(parts[1])
    decimals <- ifelse(is.na(parts[2]), 0, nchar(parts[2]))

    digits <- signif
    if (units > signif) digits <- units
    num <- signif(num, digits = digits)

    nsmall <- 0
    if (padzero & (units + decimals < signif)) {
      nsmall <- signif - units
    }

    format(
      num,
      digits = signif,
      nsmall = nsmall,
      trim = TRUE,
      big.mark = ",",
      scientific = FALSE
    )
  }

  if (spell) {

    suffixes <- list(
      pc = " per cent",
      mn = " million",
      bn = " billion",
      tn = " trillion"
    )

  } else {

    suffixes <- list(
      pc = "%",
      th = "K",
      mn = "M",
      bn = "B",
      tn = "T"
    )
  }

  labels <- c()

  for (n in N) {

    if (is.na(n)) {

      labels <- c(labels, NA)

    } else {

      label <- list()
      label$prefix <- if(is.null(currency)) NULL else currency
      label$number <- NULL
      label$suffix <- NULL

      if (pct) {

        # if (n < 1) n <- 100 * n
        label$number <- fmt(n)
        label$suffix <- suffixes$pc

      } else if (n <= 999.5) {

        label$number <- fmt(n)

      } else if (n >= 999.5 & n < 999500) {

        if (spell) {
          label$number <- fmt(n)
        } else {
          n <- n / 1000
          label$number <- fmt(n)
          label$suffix <- suffixes$th
        }

      } else if (n >= 999500 & n < 999.5 * 10^6) {

        n <- n / 10^6
        label$number <- fmt(n)
        label$suffix <- suffixes$mn

      } else if (n >= 999.5 * 10^6 & n < 999.5 * 10^9) {

        n <- n / 10^9
        label$number <- fmt(n)
        label$suffix <- suffixes$bn

      } else {

        n <- n / 10^12
        label$number <- fmt(n)
        label$suffix <- suffixes$tn
      }

      labels <- c(labels, paste0(label$prefix, label$number, label$suffix))
    }
  }

  return(labels)
}
