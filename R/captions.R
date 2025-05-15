
pl <- function(num) prettylabel(num, signif = 2, spell = TRUE)
pl1 <- function(num) prettylabel(num, signif = 2, spell = TRUE)
pl_usd <- function(num) prettylabel(num, spell = TRUE, currency = "\\$")
pl_pct <- function(num) prettylabel(num, signif = 2, pct = TRUE)
pl_pct1 <- function(num) prettylabel(num, signif = 2, pct = TRUE)

# Placeholder -------------------------------------------------------------

caption_placeholder <- function(ncol = 2) {

  caption <- paste(
    "- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
    "dignissim nec tellus sit amet cursus. Nam justo risus, dapibus in massa",
    "vitae, dictum feugiat elit.\n",
    "- Curabitur fermentum vehicula urna ac fringilla. Integer interdum orci",
    "vehicula volutpat maximus. Duis gravida vestibulum ex nec fermentum.",
    "Fusce sed aliquet ante, at ultrices leo.\n",
    "#colbreak()\n",
    "- Donec lectus urna, aliquam nec posuere quis, faucibus ac ligula.",
    "Phasellus tristique tortor eget urna scelerisque vehicula. Phasellus eu",
    "blandit felis, ac molestie neque. Vestibulum posuere leo at risus aliquam",
    "convallis.\n",
    "- Ut leo ante, faucibus vitae elit at, vulputate laoreet ligula. Sed",
    "dolor erat, ultricies eget fermentum vel, semper id nulla. Morbi sit amet",
    "feugiat ipsum."
  )

  if (ncol == 1) {

    caption <- paste(
      "- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      "dignissim nec tellus sit amet cursus. Nam justo risus, dapibus in massa",
      "vitae, dictum feugiat elit.\n",
      "- Curabitur fermentum vehicula urna ac fringilla. Integer interdum orci",
      "vehicula volutpat maximus. Duis gravida vestibulum ex nec fermentum.",
      "Fusce sed aliquet ante, at ultrices leo."
    )
  }

  if (ncol == 3) {

    caption <- paste(
      "- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      "dignissim nec tellus sit amet cursus. Nam justo risus, dapibus in massa",
      "vitae, dictum feugiat elit.\n",
      "#colbreak()\n",
      "- Curabitur fermentum vehicula urna ac fringilla. Integer interdum orci",
      "vehicula volutpat maximus. Duis gravida vestibulum ex nec fermentum.",
      "Fusce sed aliquet ante, at ultrices leo.\n",
      "#colbreak()\n",
      "- Donec lectus urna, aliquam nec posuere quis, faucibus ac ligula.",
      "Phasellus tristique tortor eget urna scelerisque vehicula. Phasellus eu",
      "blandit felis, ac molestie neque. Vestibulum posuere leo at risus aliquam",
      "convallis.\n"
    )
  }

  return(caption)
}
