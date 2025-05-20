.onLoad <- function(libname, pkgname) {
  update_geom_font_defaults()
}

.onAttach <- function(libname, pkgname) {
  if (!package_font_installed()) {
    packageStartupMessage("The Package Font: Gill Sans Nova font is missing, please install it!")
  }
}
