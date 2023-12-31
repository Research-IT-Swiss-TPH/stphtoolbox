# stphtoolbox

The Swiss TPH Toolbox (`stphtoolbox`) is an R package designed to facilitate [reproducible research](https://the-turing-way.netlify.app/reproducible-research/reproducible-research) by providing custom document templates and graphic representations.

## Features

* :page_facing_up: **Document templates**: streamline your research workflows with custom Swiss TPH templates (Word, Powerpoint).
* :bar_chart: **Graphic representation**: leverage the capabilities of `ggplot2` and create visually appealing graphics in accordance with the Swiss TPH branding guidelines.

## About

This package was developed on a Windows 10 x64 (build 19045) operating system, with R version 4.3.2 (2023-10-31 ucrt), RStudio version 2023.09.1 Build 494 and Rtools43.
For Windows users, it is recommended to install Rtools first, followed by R and RStudio in that order for a smoother experience.

## Installation from GitHub

To install the `stphtoolbox` package on your workstation, you have two options:

### Download and build locally

Download the master branch as a ZIP file and build the package locally.

### Install the latest released version (preferred option)

Install the package directly from the GitHub repository using the following code:

```{r}
library(devtools)
devtools::install_github("Research-IT-Swiss-TPH/stphtoolbox")
```

## Documentation

An index of available documentation for the `stphtoolbox` is displayed using the `help()` function

```{r}
help(package="stphtoolbox")
```

## Usage example

Generate a Word report using the `generate_word_report` function:

```{r}
# Load the stphtoolbox package
library(stphtoolbox)
# Generate a Word report
stphtoolbox::generate_word_report(qmd_filename  = "my_content_input.qmd",
                                  docx_filename = "my_word_report")
```

This will create a Word document by processing the content of your specified Quarto document "my_content_input.qmd" and save the resulting Word report as "my_word_report.docx" in your current working directory.

## Package development

### Bug reports and suggestions

If you encounter bugs or have suggestions for improvements, please open an issue. Your feedback is valuable and helps improving the package.

### Contributing

Pull requests are welcome on the `development` branch. For major changes, please open an issue first to discuss what you would like to change.
