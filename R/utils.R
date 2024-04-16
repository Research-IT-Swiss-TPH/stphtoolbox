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
#' This function generates a standardized Quarto document in DOCX format.
#'
#' @param qmd_filename    Filename of the Quarto document to be processed (with *.qmd extension).
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

  # Path to the Word metadata YAML configuration file file
  metadata_yml <- system.file("quarto",
                              "_word_metadata.yml",
                              package = "stphtoolbox")

  # Check if the Word metadata YAML configuration file exists
  if ( metadata_yml == "" ) {
    stop(paste("Could not find `_word_metadata.yml`. Try re-installing `stphtoolbox`."), call. = FALSE)
  }

  # Copy files needed by the Word metadata YMAL configuration file in the current directory
  file.copy(system.file("quarto", "report_template1.docx", package = "stphtoolbox"), cdir)
  file.copy(system.file("quarto", "docx-landscape.lua", package = "stphtoolbox"),    cdir)

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
                        metadata_file  = metadata_yml,
                        quiet          = TRUE)

}

#' Generate a Powerpoint presentation using Quarto
#'
#' This function generates a standardized Quarto document in PPTX format.
#'
#' @param qmd_filename    Filename of the Quarto document to be processed (with *.qmd extension).
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

  # Path to the Powerpoint metadata YAML configuration file file
  metadata_yml <- system.file("quarto",
                              "_ppt_metadata.yml",
                              package = "stphtoolbox")

  # Check if the Word metadata YAML configuration file exists
  if ( metadata_yml == "" ) {
    stop(paste("Could not find `_word_metadata.yml`. Try re-installing `stphtoolbox`."), call. = FALSE)
  }

  # Copy files needed by the Word metadata YMAL configuration file in the current directory
  file.copy(system.file("quarto", "ppt_template1.docx", package = "stphtoolbox"), cdir)

  # Adjust the Powerpoint filename based on the specified format
  if (filename_format == "with_date") {
    pptx_filename <- paste0(pptx_filename, '_',Sys.Date(),'.docx')
  } else{
    pptx_filename <- paste0(pptx_filename, '.docx')
  }

  # Render the Quarto document to generate the Word report
  quarto::quarto_render(input          = qmd_file,
                        output_format  = "pptx",
                        output_file    = pptx_filename,
                        execute_params = params,
                        metadata_file  = metadata_yml,
                        quiet          = TRUE)

}
