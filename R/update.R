#' Update econdataverse packages
#'
#' This will check to see if all econdataverse packages (and optionally, their
#' dependencies) are up-to-date, and will install after an interactive
#' confirmation.
#'
#' @inheritParams econdataverse_deps
#' @export
#' @examples
#' \dontrun{
#' econdataverse_update()
#' }
econdataverse_update <- function(
  recursive = FALSE,
  repos = getOption("repos")
) {
  deps <- econdataverse_deps(recursive, repos)
  behind <- deps[deps$behind, ]

  if (nrow(behind) == 0) {
    cli::cat_line("All econdataverse packages up-to-date")
    return(invisible())
  }

  cli::cat_line(cli::pluralize(
    "The following {cli::qty(nrow(behind))}package{?s} {?is/are} out of date:"
  ))
  cli::cat_line()
  cli::cat_bullet(
    format(behind$package),
    " (",
    behind$local,
    " -> ",
    behind$cran,
    ")"
  )

  cli::cat_line()
  cli::cat_line("Start a clean R session then run:")

  pkg_str <- paste0(deparse(behind$package), collapse = "\n")
  cli::cat_line("install.packages(", pkg_str, ")")

  invisible()
}

#' List all econdataverse dependencies
#'
#' @param recursive If \code{TRUE}, will also list all dependencies of
#'   econdataverse packages.
#' @param repos The repositories to use to check for updates.
#'   Defaults to \code{getOption("repos")}.
#' @export
econdataverse_deps <- function(recursive = FALSE, repos = getOption("repos")) {
  pkgs <- utils::available.packages(repos = repos)
  deps <- tools::package_dependencies(
    "econdataverse",
    pkgs,
    recursive = recursive
  )

  pkg_deps <- unique(sort(unlist(deps)))

  base_pkgs <- c(
    "base",
    "compiler",
    "datasets",
    "graphics",
    "grDevices",
    "grid",
    "methods",
    "parallel",
    "splines",
    "stats",
    "stats4",
    "tools",
    "tcltk",
    "utils"
  )
  pkg_deps <- setdiff(pkg_deps, base_pkgs)

  tool_pkgs <- c("cli")
  pkg_deps <- setdiff(pkg_deps, tool_pkgs)

  cran_version <- lapply(pkgs[pkg_deps, "Version"], package_version)
  local_version <- lapply(pkg_deps, safe_package_version)

  behind <- unlist(Map(`>`, cran_version, local_version))

  data.frame(
    package = pkg_deps,
    cran = vapply(cran_version, as.character, character(1)),
    local = vapply(local_version, as.character, character(1)),
    behind = behind
  )
}

safe_package_version <- function(pkg) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    utils::packageVersion(pkg)
  } else {
    0
  }
}
