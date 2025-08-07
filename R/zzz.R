# nocov start
.onAttach <- function(...) {
  if (is_loading_for_tests()) {
    return(invisible())
  }

  attached <- econdataverse_attach()
  inform_startup(econdataverse_attach_message(attached))

  if (is_attached("conflicted")) {
    return(invisible()) # nolint
  }
}
# nocov end

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}

is_loading_for_tests <- function() {
  !interactive() && identical(Sys.getenv("DEVTOOLS_LOAD"), "econdataverse")
}
