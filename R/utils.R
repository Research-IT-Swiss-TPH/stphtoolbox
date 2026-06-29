#' Define the Swiss TPH color palette
#'
#' This function defines a color palette with carefully selected Swiss Tropical
#' and Public Health Institute (Swiss TPH) color values. The palette includes
#' various shades of red, blue, green, yellow, and grey, providing a visually
#' harmonious set of colors for data visualization and presentation purposes.
#'
#' @return A vector containing color values for different shades.
#'
#' @export

stph_palette <- function() {

  red1    <- "#bf3227"
  red2    <- "#eca7a1"
  blue1   <- "#468ab2"
  blue2   <- "#b3d0e1"
  green1  <- "#b5c751"
  green2  <- "#e1e8b9"
  yellow1 <- "#edcd64"
  yellow2 <- "#f7ebc1"
  grey1   <- "#868686"
  grey2   <- "#cecece"

  stph_colors <- c(red1,
                   blue1,
                   green1,
                   yellow1,
                   grey1,
                   red2,
                   blue2,
                   green2,
                   yellow2,
                   grey2)

}

#' Generate a Microsoft Word report using Quarto
#'
#' Renders a Swiss TPH `.qmd` to DOCX in the working directory. The `.qmd` must
#' carry the Swiss TPH styling in its own header (see "Required YAML header");
#' the function then copies the bundled `_extensions/word-report/` extension
#' next to the `.qmd` and renders it.
#'
#' @section Required YAML header:
#' The input `.qmd` must contain these two lines (see `word_report_demo.qmd`
#' for a full example), otherwise the function stops:
#' \preformatted{
#' filters:
#'   - word-report
#' format:
#'   docx:
#'     reference-doc: _extensions/word-report/report_template2.docx
#' }
#'
#' @param qmd_filename    Filename of the Quarto document to be processed (with *.qmd extension).
#'                        Must already contain the required Swiss TPH header (see above).
#' @param docx_filename   Filename for the generated Quarto-rendered report (without *.docx extension).
#' @param filename_format Specify the filename format, options include an empty string (default) or "with_date".
#' @param params          List of parameters to customize the report generation process (optional, default is an empty list).
#'
#' @return The function does not explicitly return a value but generates a Word report in the working directory.
#'
#' @import quarto
#' @export

generate_word_report <- function(qmd_filename,
                                 docx_filename,
                                 filename_format = "",
                                 params = list()) {

  # Get the current working directory
  cdir <- getwd()

  # Check if the Quarto document filename has the correct extension
  if ( !endsWith(qmd_filename, ".qmd") ) {
    stop(paste("`", qmd_filename, "` should be a *.qmd file. Please check and correct the parameter you passed as `qmd_filename`."), call. = FALSE)
  }

  # Create the full path to the Quarto document
  qmd_file <- file.path(cdir,
                        qmd_filename)

  # Check if the Quarto document file exists
  if ( !file.exists(qmd_file) ) {
    stop(paste("Could not find `", qmd_file, "` in `", cdir, "`. Please check and correct the parameter you passed as `qmd_filename` or change the working directory."), call. = FALSE)
  }

  # The .qmd must declare the Swiss TPH styling in its header; refuse otherwise.
  header <- readLines(qmd_file, warn = FALSE)
  has_filter   <- any(grepl("word-report", header, fixed = TRUE))
  has_template <- any(grepl("reference-doc:.*word-report", header))
  if ( !has_filter || !has_template ) {
    stop(paste0("`", qmd_filename, "` is missing the required Swiss TPH header. ",
                "Add `filters: [word-report]` and a `reference-doc:` pointing into ",
                "`_extensions/word-report/` (see `?generate_word_report` or the ",
                "`word_report_demo.qmd` template)."), call. = FALSE)
  }

  # Copy the bundled word-report extension next to the .qmd so Quarto can
  # resolve the `word-report` filter and the `reference-doc:` template.
  ext_src <- system.file("quarto", "_extensions", "word-report",
                         package = "stphtoolbox")

  if ( ext_src == "" ) {
    stop("Could not find the `word-report` Quarto extension. Try re-installing `stphtoolbox`.", call. = FALSE)
  }

  dir.create(file.path(cdir, "_extensions"), showWarnings = FALSE)
  file.copy(ext_src, file.path(cdir, "_extensions"), recursive = TRUE)

  # Adjust the Word filename based on the specified format
  if (filename_format == "with_date") {
    docx_filename <- paste0(docx_filename, '_',Sys.Date(),'.docx')
  } else{
    docx_filename <- paste0(docx_filename, '.docx')
  }

  # Render the Quarto document to generate the Word report
  quarto::quarto_render(input          = qmd_file,
                        output_format  = "docx",
                        output_file    = docx_filename,
                        execute_params = params,
                        quiet          = TRUE)

}

#' Generate a Powerpoint presentation using Quarto
#'
#' Renders a Swiss TPH `.qmd` to PPTX in the working directory. The `.qmd` must
#' carry the Swiss TPH metadata in its own header (see "Required YAML header");
#' the function then copies the companion files `_ppt_metadata.yml` and
#' `ppt_template2.pptx` next to the `.qmd` and renders it.
#'
#' @section Required YAML header:
#' The input `.qmd` must contain these lines (see `ppt_report_demo.qmd` for a
#' full example), otherwise the function stops:
#' \preformatted{
#' format: pptx
#' metadata-files:
#'   - _ppt_metadata.yml
#' }
#'
#' @param qmd_filename    Filename of the Quarto document to be processed (with *.qmd extension).
#'                        Must already contain the required Swiss TPH header (see above).
#' @param pptx_filename   Filename for the generated Quarto-rendered presentation (without *.pptx extension).
#' @param filename_format Specify the filename format, options include an empty string (default) or "with_date".
#' @param params          List of parameters to customize the report generation process (optional, default is an empty list).
#'
#' @return The function does not explicitly return a value but generates a Powerpoint presentation in the working directory.
#'
#' @import quarto
#' @export

generate_ppt_report <- function(qmd_filename,
                                pptx_filename,
                                filename_format = "",
                                params = list()) {

  # Get the current working directory
  cdir <- getwd()

  # Check if the Quarto document filename has the correct extension
  if ( !endsWith(qmd_filename, ".qmd") ) {
    stop(paste("`", qmd_filename, "` should be a *.qmd file. Please check and correct the parameter you passed as `qmd_filename`."), call. = FALSE)
  }

  # Create the full path to the Quarto document
  qmd_file <- file.path(cdir,
                        qmd_filename)

  # Check if the Quarto document file exists
  if ( !file.exists(qmd_file) ) {
    stop(paste("Could not find `", qmd_file, "` in `", cdir, "`. Please check and correct the parameter you passed as `qmd_filename` or change the working directory."), call. = FALSE)
  }

  # The .qmd must declare the Swiss TPH PowerPoint metadata; refuse otherwise.
  header <- readLines(qmd_file, warn = FALSE)
  has_format   <- any(grepl("pptx", header, fixed = TRUE))
  has_metadata <- any(grepl("_ppt_metadata.yml", header, fixed = TRUE))
  if ( !has_format || !has_metadata ) {
    stop(paste0("`", qmd_filename, "` is missing the required Swiss TPH header. ",
                "Add `format: pptx` and `metadata-files: [_ppt_metadata.yml]` ",
                "(see `?generate_ppt_report` or the `ppt_report_demo.qmd` template)."), call. = FALSE)
  }

  # Copy the companion files the .qmd header expects, next to the .qmd:
  # _ppt_metadata.yml pulls in the template, ppt_template2.pptx is the template.
  for (f in c("_ppt_metadata.yml", "ppt_template2.pptx")) {
    src <- system.file("quarto", f, package = "stphtoolbox")
    if ( src == "" ) {
      stop(paste0("Could not find `", f, "`. Try re-installing `stphtoolbox`."), call. = FALSE)
    }
    file.copy(src, cdir, overwrite = TRUE)
  }

  # Adjust the Powerpoint filename based on the specified format
  if (filename_format == "with_date") {
    pptx_filename <- paste0(pptx_filename, '_',Sys.Date(),'.pptx')
  } else{
    pptx_filename <- paste0(pptx_filename, '.pptx')
  }

  # Render the Quarto document to generate the PowerPoint presentation
  quarto::quarto_render(input          = qmd_file,
                        output_format  = "pptx",
                        output_file    = pptx_filename,
                        execute_params = params,
                        quiet          = TRUE)

}
