inform_startup <- function(msg, ...) {
  if (is.null(msg)) {
    return()
  }
  if (isTRUE(getOption("econdataverse.quiet"))) {
    return()
  }

  rlang::inform(msg, ..., class = "packageStartupMessage")
}

#' List all packages in the econdataverse
#'
#' @param include_self Include econdataverse in the list?
#' @export
#' @examples
#' econdataverse_packages()
econdataverse_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("econdataverse")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))

  if (include_self) {
    names <- c(names, "econdataverse")
  }

  names
}

invert <- function(x) {
  if (length(x) == 0) {
    return()
  }
  stacked <- utils::stack(x)
  tapply(as.character(stacked$ind), stacked$values, list)
}
