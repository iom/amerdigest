
# Mobility in the Americas Data Digest

<!-- badges: start -->

<!-- badges: end -->

This R package generates a data digest for a given country in the
Americas containing information on regular and irregular migration.

## Installation

You can install the development version of amerdigest from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("iom/amerdigest")
```

## Example

The main function is `render_digest(iso)`, where `iso` is the
three-letter ISO code of the country of choice.

``` r
library(amerdigest)
render_digest(country_iso="ARG")  # Generate digest for Argentina
```
