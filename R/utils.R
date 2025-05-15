
# Parameters --------------------------------------------------------------

basesize <- 7
font <- "Open Sans"


# Chart helpers -----------------------------------------------------------

set_axis <- function(values, units = "Persons") {

  max_n <- max(values, na.rm = TRUE)

  write_title <- function(scale, units) {
    if (units == "USD") text <- paste0(scale, " ", units)
    else text <- paste0(scale, " of ", tolower(units))
    return(text)
  }

  output <- list(
    breaks = waiver(),
    labels = function(x) x / 10^6,
    title = write_title("Millions", units)
  )

  if (max_n < 12) {
    output$title <- units
    output$breaks <- c(0, 5, 10)
    output$labels <- waiver()
  }
  if (max_n >= 12 & max_n < 1200) {
    output$title <- units
    output$labels <- waiver()
  }
  if (max_n >= 1200 & max_n < 1.20 * 10^6) {
    output$title <- write_title("Thousands", units)
    output$labels <- function(x) x / 1000
  }
  if (max_n >= 1.20 * 10^6 & max_n < 1.40 * 10^6) {
    output$breaks <- seq(0, 1.25 * 10^6, .25 * 10^6)
    output$labels <- c("0", "0.25", "0.50", "0.75", "1.00", "1.25")
  }
  if (max_n >= 1.40 * 10^6 & max_n < 1.80 * 10^6) {
    output$breaks <- seq(0, 1.50 * 10^6, .50 * 10^6)
    output$labels <- c("0", "0.5", "1.0", "1.5")
  }

  if (max_n >= 1.20 * 10^9 & max_n < 1.40 * 10^9) {
    output$title <- write_title("Billions", units)
    output$breaks <- seq(0, 1.50 * 10^9, .25 * 10^9)
    output$labels <- c("0", "0.25", "0.50", "0.75", "1.00", "1.25", "1.50")
  }
  if (max_n >= 1.40 * 10^9 & max_n < 1.80 * 10^9) {
    output$title <- write_title("Billions", units)
    output$breaks <- seq(0, 1.50 * 10^9, .50 * 10^9)
    output$labels <- c("0", "0.5", "1.0", "1.5")
  }
  if (max_n >= 1.80 * 10^9) {
    output$title <- write_title("Billions", units)
    output$labels <- function(x) x / 10^9
  }

  return(output)
}

plot_label <- function(plot, label, span = 2, h = .06) {

  box <- grid::rectGrob(gp = grid::gpar(fill = pal("unblues", 3), col = NA))

  width <- .025 + .015 * nchar(label)
  height <- h
  if (span == 1) width <- width / 2
  if (span == 3) width <- width * 1.5

  cowplot::ggdraw(plot) +
    cowplot::draw_grob(
      box,
      x = 0,
      y = 1,
      vjust = 1,
      width = width,
      height = height
    ) +
    cowplot::draw_label(
      label,
      x = width / 2,
      y = 1 - height / 2,
      hjust = .5,
      vjust = .5,
      size = basesize,
      fontface = "bold",
      fontfamily = font,
      color = "white"
    )
}




