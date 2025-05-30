# WARNING - Generated by {fusen} from dev/flat_my_fun.Rmd: do not edit by hand # nolint: line_length_linter.

#' Placeholder caption text generator
#'
#' Generates a placeholder caption string with sample lorem ipsum text,
#' formatted into 1, 2 (default), or 3 columns, with special column break markers.
#'
#' @param ncol Integer. Number of columns for caption layout. One of 1, 2, or 3. Default is 2.
#' @return Character string with placeholder caption text.
#' @export
#' @examples
#' cat(caption_placeholder(1))  # One-column placeholder caption
#' cat(caption_placeholder(2))  # Two-column placeholder caption (default)
#' cat(caption_placeholder(3))  # Three-column placeholder caption


caption_placeholder <- function(ncol = 2) {

  # Validate input
  if (!ncol %in% c(1, 2, 3)) {
    stop("ncol must be 1, 2, or 3")
  }

  if (ncol == 1) {
    caption <- paste(
      "- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      "dignissim nec tellus sit amet cursus. Nam justo risus, dapibus in massa",
      "vitae, dictum feugiat elit.\n",
      "- Curabitur fermentum vehicula urna ac fringilla. Integer interdum orci",
      "vehicula volutpat maximus. Duis gravida vestibulum ex nec fermentum.",
      "Fusce sed aliquet ante, at ultrices leo."
    )
  } else if (ncol == 3) {
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
  } else { # ncol == 2 (default)
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
  }

  return(caption)
}
