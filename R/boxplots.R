#' Generate a vertical boxplot for a given data frame, continuous variable, and categorical variable.
#'
#' This function creates a vertical boxplot using ggplot2 for visualizing the distribution
#' of a continuous variable across different categories.
#'
#' @param df              A data frame containing the variables of interest.
#' @param continuous_var  A character string specifying the name of the continuous variable.
#' @param categorical_var A character string specifying the name of the categorical variable.
#'
#' @return A ggplot2 object representing the vertical boxplot.
#'
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom rlang sym
#'
#' @export

vertical_boxplot <- function (df,
                              continuous_var,
                              categorical_var) {

  # Convert variable names to symbols using rlang::sym
  continuous_var  <- rlang::sym(continuous_var)
  categorical_var <- rlang::sym(categorical_var)

  # Get the default color palette from stphtoolbox package
  stph_colors <- stphtoolbox::stph_palette()

  # Create a ggplot object with a vertical boxplot
  df %>%
    ggplot2::ggplot() +
    ggplot2::geom_boxplot(mapping = ggplot2::aes(y    = !!continuous_var,
                                                 fill = !!categorical_var)) +
    # Set custom fill colors using the stph_colors palette
    ggplot2::scale_fill_manual(values = unlist(stph_colors)) +
    # Customize the theme of the plot
    ggplot2::theme_bw() +
    ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                   panel.grid.minor.x = ggplot2::element_blank(),
                   axis.text.x        = ggplot2::element_blank(),
                   axis.ticks.x       = ggplot2::element_blank())
}
