#' Print skills block
#'
#' Formats and prints a latex string.
#' @param x dataframe with columns id and text
#' @importFrom glue glue_data
#' @return None (invisible NULL)
#' @export
print_skills_block <- function(x) {

  cat("\\begin{keywords}")
  cat(skills_block(x))
  cat("\\end{keywords}")

  invisible(NULL)
}



#' Construct skills block
#'
#' @param x dataframe with columns id and text
#'
#' @return latex formatted string
#' @importFrom glue glue_data
#' @keywords internal
#' @noRd
skills_block <- function(x) {
  glue_template <- "
\\keywordsentry{{{id}}}{{{text}}}"

  glue::glue_data(x, glue_template)
}

