#' Print referee block
#'
#' @param x data frame with columns: name, title, institute, email, and phone
#'
#' @return Nothing (invisible NULL)
#' @export
#'
print_referee_block <- function(x) {

  cat("\\begin{referees}")
  cat(referee_block(x))
  cat("\\end{referees}")

  invisible(NULL)
}


#' Construct referee block
#'
#' @param x data frame with columns: name, title, institute, email, and phone
#'
#' @return latex formatted string
#' @importFrom glue glue_data
#' @keywords internal
#' @noRd
referee_block <- function(x) {
  glue_template <- "
\\referee{{{name}}}{{{title}}}{{{institute}}}{{{email}}}{{{phone}}}"

  glue::glue_data(x, glue_template)
}
