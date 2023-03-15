#' Open file for editing
#'
#' Opens a file for editing in RStudio, if that is the active environment, or
#' via [utils::file.edit()] otherwise.
#'
#' @param path Path to target file.
#' @param open Whether to open the file for interactive editing.
#' @return Target path, invisibly.
#' @export
#' @import rstudioapi
#' @import rlang
#' @importFrom utils file.edit
#' @keywords internal
#'
edit_file <- function(path, open = rlang::is_interactive()) {
  open <- open && is_interactive()

  if (!open) {
    return(invisible(path))
  }

  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(path)
  } else {
    utils::file.edit(path)
  }
  invisible(path)
}


find_quarto <- function() {
  path <- quarto_path()
  if (is.null(path)) {
    stop("Quarto command-line tools path not found! Please make sure you have installed and added Quarto to your PATH or set the QUARTO_PATH environment variable.")
  } else {
    return(path)
  }
}


quarto_path <- function() {
  path_env <- Sys.getenv("QUARTO_PATH", unset = NA)
  if (is.na(path_env)) {
    path <- unname(Sys.which("quarto"))
    if (nzchar(path)) path else NULL
  } else {
    path_env
  }
}
