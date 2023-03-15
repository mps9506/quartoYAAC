#' Print experience block
#'
#' Formats and prints a latex string
#' @param x dataframe with columns: enddate, positiontitle, institution, location, startdate, descriptionbullets, and skilltag.
#'
#' @return Nothing (invisible NULL)
#' @export
#'
print_experience_block <- function(x) {
  cat("\\begin{experiences}")
  cat(experience_block(x))
  cat("\\end{experiences}")

  invisible(NULL)
}

#' Construct skills experience block
#'
#' @param x dataframe with columns: enddate, positiontitle, institution, location, startdate, descriptionbullets, and skilltag.
#'
#' @return latex formatted string
#' @importFrom glue glue_data
#' @keywords internal
#' @noRd
experience_block <- function(x) {

  glue_template <- "
  \\experience
  {{{enddate}}}{{{positiontitle}}}{{{institution}}}{{{location}}}{{{startdate}}}
{{\\begin{{itemize}}
{description_bullets}
\\end{{itemize}}}}
{{{skilltag}}}
\\emptySeparator"

  glue::glue_data(x, glue_template, .na="")

}
