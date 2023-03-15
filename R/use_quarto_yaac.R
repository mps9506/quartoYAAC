#' Use the Quarto-YAAC template
#'
#' Adds a subdirectory and necessary files to use the Quarto-YAAC
#' \url{https://github.com/mps9506/quarto-yaac} template.
#'
#' @param file_name Name of new qmd file and sub-directory to be created
#'
#' @return a message if extension was successfully copied over
#' @export
#' @import fs
#' @import cli
use_quarto_yaac <- function(file_name = NULL,
                            overwrite_qmd = TRUE) {

  ## check file name (probably check is character also)
  if (is.null(file_name)) {
    stop("You must provide a valid file_name")
  }

  ## set the output directory
  out_dir <- file_name

  ## create the output directory
  if(!dir.exists(out_dir)) {
    dir.create(out_dir)
  }

  ## get quarto path or return message
  quarto_bin <- find_quarto()

  ## need the work directory so I can change where the system command is run
  orig_wd <- fs::path_wd()
  quarto_wd <- fs::path_wd(out_dir)

  ## temporarily change to subdirectory
  setwd(quarto_wd)

  ## adds template files
  tryCatch({
    out <- system2(quarto_bin,
                   args = "use template mps9506/quarto-yaac --no-prompt",
                   stdout = TRUE,
                   stderr = TRUE)
    cli::cli_ul(out)},
    error = function(err) {
      cli::cli_alert_danger(out)
    },
    ## could probably provide more informative warning
    warning = function(w) {
      cli::cli_alert_warning(out)
    }

  )


  ## go back to original working directory
  setwd(orig_wd)

  ## check that the files were created and open
  template_file <- fs::path(out_dir, out_dir, ext = "qmd")

  ## overwrite the template.qmd file with the package skeleton.qmd file4
  skeleton <- fs::path_package(package = "quartoYAAC",
                               "quarto-yaac", "skeleton.qmd")
  skeleton <- readLines(skeleton)

  writeLines(skeleton,
             template_file)



  file_check <- fs::file_exists(template_file)
  if (isTRUE(file_check)){
    message("succesfully added quarto-yaac template files to the project.")
    edit_file(template_file)
  }
}
