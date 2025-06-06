% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_regflow.R
\name{get_regflow}
\alias{get_regflow}
\title{Aggregates and combines registration inflow and outflow data.}
\usage{
get_regflow(iso = NULL)
}
\arguments{
\item{iso}{Optional character. ISO3 country code to filter the data by geography.
If NULL (default), returns data for all geographies.}
}
\value{
A data frame with columns \code{geo}, \code{t}, \code{n}, and \code{var}, where \code{var} indicates
whether the count is "Entries" or "Exits".
}
\description{
Aggregates and combines registration inflow and outflow data.
}
\examples{
# Get all regional flows
all_flows <- get_regflow()

knitr::kable(head(all_flows,5))

# Get flows for USA only
usa_flows <- get_regflow("USA")

knitr::kable(head(usa_flows,5))
}
