% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{edit_file}
\alias{edit_file}
\title{Open file for editing}
\usage{
edit_file(path, open = rlang::is_interactive())
}
\arguments{
\item{path}{Path to target file.}

\item{open}{Whether to open the file for interactive editing.}
}
\value{
Target path, invisibly.
}
\description{
Opens a file for editing in RStudio, if that is the active environment, or
via [utils::file.edit()] otherwise.
}
\keyword{internal}
