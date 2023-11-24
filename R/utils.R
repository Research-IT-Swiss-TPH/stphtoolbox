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
