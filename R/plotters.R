
# Functions for plotting

plot_empty <- function(title,
                       source,
                       basesize = basesize,
                       font = font,
                       msg = "No data") {

  k <- function(factor = 1) factor * basesize / .pt

  plot <- ggplot(data.frame(i = 1:10), aes(x = i)) +
    labs(title = title, caption = source) +
    apply_theme("line", basesize = basesize, font = font) +
    theme(
      axis.text = element_blank(),
      panel.background = element_rect(color = NA, fill = pal("unblues", 6)),
      plot.caption = element_text(
        margin = margin(t = k(), r = k(), l = k())
      ),
    )

  plot <- ggdraw(plot) +
    draw_label(
      msg,
      y = .5,
      fontfamily = font,
      color = pal("blues", 3),
      size = k(3)
    )

  return(plot)
}

plot_regflow <- function(iso,
                         basesize = basesize,
                         font = font,
                         title = "Regular entries and exits") {

  k <- function(factor = 1) factor * basesize / .pt
  source <- "Source: IOM Lighthouse Project."

  data <- digest_data("regflow", iso)

  if (nrow(data) > 0) {

    axis <- set_axis(data$n, "Persons")

    plot <- ggplot(data, aes(x = t, y = n, group = var, color = var)) +
      geom_line(linewidth = k(.25)) +
      geom_hline(
        yintercept = 0,
        color = pal("blues"),
        linewidth = k(.1)
      ) +
      labs(title = title, caption = source) +

      scale_x_yearmonth(
        date_breaks = "1 year",
        date_minor_breaks = "3 months",
        date_labels = "%Y",
        expand = expansion(mult = c(0, .03)),
        guide = guide_axis(minor.ticks = TRUE)
      ) +
      scale_y_continuous(
        name = axis$title,
        breaks = axis$breaks,
        labels = axis$labels
      ) +
      scale_color_manual(
        values = c(pal("blues", 2), pal("greens"))
      ) +

      apply_theme("line", basesize = basesize, font = font) +
      theme(
        axis.title.y = element_text(
          size = basesize,
          margin = margin(r = k(2))
        ),
        axis.ticks.x = element_line(
          color = pal("blues"),
          linewidth = k(.05)
        ),
      )
  } else {
    plot <- plot_empty(title, source)
  }

  return(plot)
}


plot_regnet <- function(iso,
                        basesize = basesize,
                        font = font,
                        title = "Net regular entries") {

  k <- function(factor = 1) factor * basesize / .pt
  source <- "Source: IOM Lighthouse Project."

  data <- digest_data("regnet", iso)

  if (nrow(data) > 0) {

    axis <- set_axis(data$n, "Persons")

    plot <- ggplot(data, aes(x = t, y = n)) +
      geom_bar(
        stat = "identity",
        fill = ifelse(data$n >= 0, pal("blues", 2), pal("greens"))
      ) +
      geom_hline(
        yintercept = 0,
        color = pal("blues"),
        linewidth = k(.1)
      ) +
      labs(title = title, caption = source) +

      scale_x_yearmonth(
        date_breaks = "1 year",
        date_minor_breaks = "3 months",
        date_labels = "%Y",
        expand = expansion(mult = c(.03, .03)),
        guide = guide_axis(minor.ticks = TRUE)
      ) +
      scale_y_continuous(
        name = axis$title,
        breaks = axis$breaks,
        labels = axis$labels
      ) +

      apply_theme("bar-vertical", basesize = basesize, font = font) +
      theme(
        axis.title.y = element_text(
          size = basesize,
          margin = margin(r = k(2))
        ),
        axis.ticks.x = element_line(
          color = pal("blues"),
          linewidth = k(.05)
        ),
      )
  } else {
    plot <- plot_empty(title, source)
  }

  return(plot)
}



