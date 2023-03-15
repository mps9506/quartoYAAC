#' Print project block
#'
#' @param x data frame with the following columns: project_name, dates, repo, link, description, and tags.
#'
#' @return Nothing (invisible NULL)
#' @export
#'
print_project_block <- function(x) {
  cat("\\begin{projects}")
  cat(project_block(x))
  cat("\\end{projects}")

  invisible(NULL)
}


#' Construct project block
#'
#' @param x data frame with the following columns: project_name, dates, repo, link, description, and tags.
#' #'
#' @return latex formatted string
#' @importFrom glue glue_data
#' @keywords internal
#' @noRd
project_block <- function(x) {
  glue_template <- "
    \\project
  {{{project_name}}}{{{dates}}}{{{links}}}{{{description}}}
{{{tags}}}
"
  glue::glue_data(x, glue_template, .na="")
}
