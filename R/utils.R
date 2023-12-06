#' Define the Swiss TPH color palette
#'
#' This function defines a color palette with carefully selected Swiss Tropical
#' and Public Health Institute (Swiss TPH) color values. The palette includes
#' various shades of red, blue, green, yellow, and grey, providing a visually
#' harmonious set of colors for data visualization and presentation purposes.
#'
#' @return A vector containing color values for different shades.
#' @export
palette <- function() {

  red1    <- "#be3427"
  red2    <- "#e27b73"
  blue1   <- "#478bb7"
  blue2   <- "#b4d1e1"
  green1  <- "#b5c751"
  yellow1 <- "#edcd64"
  grey1   <- "#717073"
  grey2   <- "#babcbe"

  stph_colors <- c(red1,
                   blue1,
                   green1,
                   yellow1,
                   grey1,
                   blue2,
                   grey2)

}

#' Generate a Microsoft Word report using Quarto
#'
#' This function generates a standardised Quarto document in a DOCX format
#'
#' @param report_dir Path to the folder where the generated DOCX Quarto report is stored
#' @param quarto_filename Filename of the Quarto document to run
#' @param report_filename Filename of the Quarto rendered report
#' @param params List of parameters
#' @import quarto
#' @export

generate_word_report <- function(report_dir,
                                 quarto_filename,
                                 report_filename,
                                 params = list()) {

  quarto_doc <- system.file("quarto",
                            quarto_filename,
                            package = "stphtoolbox")

  if (quarto_doc == "") {
    stop(paste("Could not find `", quarto_filename, "`. Try re-installing `stphtoolbox`."), call. = FALSE)
  }

  quarto::quarto_render(input          = quarto_doc,
                        output_file    = paste0(report_filename, '_',Sys.Date(),'.docx'),
                        execute_dir    = report_dir,
                        execute_params = params,
                        quiet          = TRUE)

}
