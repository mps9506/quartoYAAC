#' Print education block
#'
#' @param x data frame with end_date, degree, and institution
#'
#' @return Nothing (invisible NULL)
#' @export
#'
print_education_block <- function(x) {
  cat("\\begin{scholarship}")
  cat(education_block(x))
  cat("\\end{scholarship}")

  invisible(NULL)
}

education_block <- function(x) {
  glue_template <- "
  \\scholarshipentry
{{{end_date}}}{{{degree}, {institution}}}"
  glue::glue_data(x, glue_template, .na="")
}
