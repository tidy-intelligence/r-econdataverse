#' @keywords internal
"_PACKAGE"

# Suppress R CMD check note
# Namespace in Imports field not imported from: PKG
#   All declared Imports should be used.
ignore_unused_imports <- function() {
  econid::add_entity_pattern()
  econtools::add_gdp_column()
  imfweo::weo_cache_reset()
  oecdoda::oda_get_crs()
  owidapi::owid_embed()
  uisapi::uis_bulk_files()
  wbids::ids_bulk()
  wbwdi::wdi_get()
}
