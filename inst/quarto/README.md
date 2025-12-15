# Introduction

This user guide explains how to use the [Swiss TPH Quarto templates](https://github.com/Research-IT-Swiss-TPH/stphtoolbox/tree/main/inst/quarto).

Before getting started, we recommend having some basic knowledge of Quarto. Quarto is a system for creating dynamic and reproducible content with Python, R, Julia, and Observable. It supports a variety of formats, including HTML, PDF, MS Word, and ePub. If you have never used Quarto before but are interested in learning, please refer to the [Swiss TPH Quarto training](https://research-it-swiss-tph.github.io/quarto_training/).

Our templates function as Quarto extensions. Extensions are a powerful way to modify and enhance Quarto’s behavior. To help Swiss TPH staff and students use Quarto easily while maintaining Swiss TPH corporate identity, we have designed the following extensions:

- Swiss TPH Powerpoint template
- Swiss TPH MS Word template
- Swiss TPH PDF report template
- Swiss TPH PDF letter template

# Swiss TPH Powerpoint template

Step 1: Download all necessary files into your working directory. They must be located in the same folder.

- [ppt_template1.pptx](./ppt_template1.pptx)
- [ppt_report_demo.qmd](./ppt_report_demo.qmd)
- [\_ppt\_metadata.yml](./_ppt_metadata.yml)

Step 2: Open `ppt_report_demo.qmd` in RStudio. We recommend creating an R project (`.Rproj`) in the same directory to ensure your working directory is correctly set.

Step 3: Modify the `.qmd` file as needed. Be sure to update the file path of the example image to the correct location. For general guidance on using Quarto for PowerPoint, please refer to: [Powerpoint - Quarto](https://quarto.org/docs/presentations/powerpoint.html).

Step 4: Render the `.qmd` file and save the output `.pptx` file.

# Swiss TPH MS Word template

Step 1: Download all necessary files into your working directory. They must be located in the same folder.

- [report_template1.docx](./report_template1.docx)
- [word_report_demo.qmd](./word_report_demo.qmd)
- [\_word\_metadata.yml](./_word_metadata.yml)
- [docx-landscape.lua](./docx-landscape.lua)

Step 2: Open `word_report_demo.qmd` in RStudio. We recommend creating an R project (`.Rproj`) in the same directory to ensure your working directory is correctly set.

Step 3: Modify the `.qmd` file as needed. For general guidance on using Quarto with MS Word, please refer to: [Word Basics - Quarto](https://quarto.org/docs/output-formats/ms-word.html).

Step 4: Render the `.qmd` file and save the output `.docx` file.

# Swiss TPH PDF report template

Step 1: Download the `_extensions/report/` folder into your working directory. **IMPORTANT**: Do not change the directory structure. The path to this folder must remain `./_extensions/report/` relative to your current working directory; otherwise, rendering will fail.

Step 2: Download the remaining required files into your working directory:

- [report_simple_demo.qmd](./report_simple_demo.qmd)
- [references.bib](./references.bib)

Step 3: Modify the `.qmd` file as needed. For general guidance on Quarto PDF rendering, please refer to: [PDF Basic - Quarto](https://quarto.org/docs/output-formats/pdf-basics.html).

Step 4: You may replace `reference.bib` with your own bibliography or remove it if you do not require references. If you remove it, make sure to delete the corresponding entry in the `.qmd` file.

Step 5: Render the `.qmd` file and save the output `.pdf` file.

# Swiss TPH PDF letter template

Step 1: Download the `_extensions/letter/` folder into your working directory. **IMPORTANT**: Do not change the directory structure. The path to this folder must remain `./_extensions/letter/` relative to your current working directory; otherwise, rendering will fail.

Step 2: Download the remaining required file into your working directory:

- [letter_demo.qmd](./letter_demo.qmd)

Step 3: Modify the `.qmd` file as needed. Be sure to update the file path of the example image to the correct location. For general guidance on Quarto PDF rendering, please refer to: [PDF Basic - Quarto](https://quarto.org/docs/output-formats/pdf-basics.html).

Step 4: Render the `.qmd` file and save the output `.pdf` file.
