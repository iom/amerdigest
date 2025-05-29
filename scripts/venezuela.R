
library(tidyverse)
library(tsibble)

# Figure 1 ----------------------------------------------------------------

data <- regin |>
  filter(nat == "VEN")

data_agg <- data |>
  summarise(n = sum(n), .by = c(geo, nat))

data_plot <- data |>
  filter(geo %in% c(
    "COL",
    "BRA",
    "MEX",
    "ARG",
    "ECU",
    "PER"
  ))

axis <- set_axis(data_plot$n)

ggplot(data_plot, aes(x = t, y = n, color = geo, group = geo)) +
  geom_line() +

  scale_x_yearmonth(
    date_breaks = "1 year",
    date_labels = "%Y"
  ) +
  scale_y_continuous(
    name = axis$title,
    labels = axis$label,
    expand = expansion(mult = c(.05, .1))
  ) +
  scale_color_manual(
    breaks = c(
      "COL",
      "MEX",
      "BRA",
      "ECU",
      "PER",
      "ARG"
    ),
    labels = c(
      "Colombia",
      "Mexico",
      "Brazil",
      "Ecuador",
      "Peru",
      "Argentina"
    ),
    values = c(
      pal("blues", 2),
      pal("blues", 4),
      pal("reds", 2),
      pal("reds", 4),
      pal("greens", 1),
      pal("yellows", 1)
    )
  ) +

  apply_theme("line") +
  theme(
    axis.title.y = element_text(size = basesize),
    legend.position = "right",
    legend.box.spacing = unit(k(0), "points"),
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(k(4), k(4), k(4), k(4))
  )

ggsave(
  "figures/venezuela-1.png",
  device = png, width = 12, height = 6, unit = "cm"
)


# Figure 2 ----------------------------------------------------------------

data <- irreg |>
  filter(nat == "VEN")

data_agg <- data |>
  summarise(n = sum(n), .by = c(geo, nat))

data_plot <- data |>
  filter(t >= yearmonth("Jan 2024"))

axis <- set_axis(data_plot$n)

ggplot(data_plot, aes(x = t, y = n, color = geo, group = geo)) +
  geom_line() +

  scale_x_yearmonth(
    date_breaks = "3 months",
    date_labels = "%b %Y"
  ) +
  scale_y_continuous(
    name = axis$title,
    labels = axis$label,
    expand = expansion(mult = c(.05, .1))
  ) +
  scale_color_manual(
    breaks = c(
      "COL",
      "MEX",
      "HND",
      "PAN"
    ),
    labels = c(
      "Colombia",
      "Mexico",
      "Honduras",
      "Panama"
    ),
    values = c(
      pal("blues", 2),
      pal("reds", 2),
      pal("greens", 1),
      pal("yellows", 1)
    )
  ) +

  apply_theme("line") +
  theme(
    axis.title.y = element_text(size = basesize),
    legend.position = "right",
    legend.box.spacing = unit(k(0), "points"),
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(k(4), k(4), k(4), k(4))
  )

ggsave(
  "figures/venezuela-2.png",
  device = png, width = 12, height = 6, unit = "cm"
)



# Figure 3 ----------------------------------------------------------------

data <- full_join(
  regin |>
    filter(nat == "VEN") |>
    select(t, geo, regin = n),
  regout |>
    filter(geo == "VEN") |>
    select(t, geo = nat, regout = n),
  by = c("t", "geo")
) |>
  replace_na(list(regin = 0, regout = 0)) |>
  mutate(net = regin - regout) |>
  arrange(geo, t) |>
  mutate(n = cumsum(net), .by = geo)

data_plot <- data |>
  filter(t %in% c(yearmonth("Dec 2023"), yearmonth("Dec 2024"), max(t))) |>
  complete(
    t = c(yearmonth("Dec 2023"), yearmonth("Dec 2024"), yearmonth("Apr 2025")),
    geo,
    fill = list(n = 0)
  )

axis <- set_axis(data_plot$n)

ggplot(
  data_plot,
  aes(x = fct_reorder(geo, -n), y = n, fill = factor(t))
) +
  geom_bar(stat = "identity", position = "dodge") +

  scale_x_discrete(
    labels = function(x) gdidata::countryname(x, to = "name_text")
  ) +
  scale_y_continuous(
    name = axis$title,
    labels = axis$label,
    expand = expansion(mult = c(.05, .1))
  ) +
  scale_fill_manual(
    labels = c("End 2023", "End 2024", "Apr 2025"),
    values = c(
      pal("blues", 4),
      pal("blues", 3),
      pal("blues", 2)
    )
  ) +

  apply_theme("bar-vertical")


ggsave(
  "figures/venezuela-3.png",
  device = png, width = 12, height = 6, unit = "cm"
)


