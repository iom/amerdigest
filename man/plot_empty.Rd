% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_empty.R
\name{plot_empty}
\alias{plot_empty}
\title{Generate an Empty Placeholder Plot}
\usage{
plot_empty(title, source, basesize = 7, font = "Open Sans", msg = "No data")
}
\arguments{
\item{title}{Plot title.}

\item{source}{Data source caption.}

\item{basesize}{Base font size. Default is 7.}

\item{font}{Font family. Default is "Open Sans".}

\item{msg}{Message to display. Default is "No data".}
}
\value{
A ggplot2 object with a placeholder message.
}
\description{
Generate an Empty Placeholder Plot
}
\examples{
plot_empty("No Data", "Source: Example Org")
}
