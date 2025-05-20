#' Regular Entries
#'
#' Monthly count of regular entries into selected American countries.
#'
#' \describe{
#'   \item{t}{month-year of count}
#'   \item{geo}{reporting country (ISO-3)}
#'   \item{nat}{nationality (ISO-3)}
#'   \item{n}{count of individuals}
#' }
#'
#' @details Compiled from published administrative data through the IOM
#'   Lighthouse Project.
#'
#' @source IOM Lighthouse Project; various governments.
"regin"


#' Regular Exits
#'
#' Monthly count of regular exits from selected American countries.
#'
#' \describe{
#'   \item{t}{month-year of count}
#'   \item{geo}{reporting country (ISO-3)}
#'   \item{nat}{nationality (ISO-3)}
#'   \item{n}{count of individuals}
#' }
#'
#' @details Compiled from published administrative data through the IOM
#'   Lighthouse Project.
#'
#' @source IOM Lighthouse Project; various governments.
"regout"


#' Irregular Entries
#'
#' Monthly count of irregular entries from selected American countries.
#'
#' \describe{
#'   \item{t}{month-year of count}
#'   \item{geo}{reporting country (ISO-3)}
#'   \item{nat}{nationality (ISO-3)}
#'   \item{n}{count of individuals}
#' }
#'
#' @details Compiled from published administrative data through the IOM
#'   Lighthouse Project.
#'
#' @source IOM Lighthouse Project; various governments.
"irreg"

#' @title Countrynames
#' @description Countrynames
#' @format A data frame with 257 rows and 22 variables:
#' \describe{
#'   \item{\code{m49}}{double COLUMN_DESCRIPTION}
#'   \item{\code{iso2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{iso3}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_sort}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_text}}{character COLUMN_DESCRIPTION}
#'   \item{\code{with_the}}{double COLUMN_DESCRIPTION}
#'   \item{\code{region_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{region}}{character COLUMN_DESCRIPTION}
#'   \item{\code{subregion_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{subregion}}{character COLUMN_DESCRIPTION}
#'   \item{\code{intregion_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{intregion}}{character COLUMN_DESCRIPTION}
#'   \item{\code{iom_region}}{character COLUMN_DESCRIPTION}
#'   \item{\code{rdh}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ldc}}{double COLUMN_DESCRIPTION}
#'   \item{\code{lldc}}{double COLUMN_DESCRIPTION}
#'   \item{\code{sids}}{double COLUMN_DESCRIPTION}
#'   \item{\code{eu}}{double COLUMN_DESCRIPTION}
#'   \item{\code{schengen}}{double COLUMN_DESCRIPTION}
#'   \item{\code{balkans}}{double COLUMN_DESCRIPTION}
#'   \item{\code{snapshot}}{double COLUMN_DESCRIPTION}
#'}
#' @source IOM Lighthouse Project; various governments.
"countrynames"
