# Introduction

This user guide explains how to use the [Swiss TPH Quarto templates](https://github.com/Research-IT-Swiss-TPH/stphtoolbox/tree/main/inst/quarto).

Before getting started, we recommend having some basic knowledge of Quarto. Quarto is a system for creating dynamic and reproducible content with Python, R, Julia, and Observable. It supports a variety of formats, including HTML, PDF, MS Word, and ePub. If you have never used Quarto before but are interested in learning, please refer to the [Swiss TPH Quarto training](https://research-it-swiss-tph.github.io/quarto_training/).

Our templates function as Quarto extensions. Extensions are a powerful way to modify and enhance Quarto’s behavior. To help Swiss TPH staff and students use Quarto easily while maintaining Swiss TPH corporate identity, we have designed the following extensions:

- Swiss TPH PowerPoint template
- Swiss TPH MS Word template
- Swiss TPH PDF report template (LaTeX and Typst)
- Swiss TPH PDF letter template (LaTeX and Typst)

## AI Usage

The latest versions of the PowerPoint and Word templates were developed with the help of Claude.

## A note on the old templates

The current templates use the Swiss TPH indigo corporate identity and the Aptos font. The previous-generation templates (Swiss TPH blue, Microsoft Sans Serif) are **still kept in the repository for reference and backward compatibility**, but are no longer the recommended choice:

| Template | Current (recommended) | Old (kept for reference) |
|----------|-----------------------|--------------------------|
| PowerPoint | `ppt_template2.pptx` | `ppt_template1.pptx` |
| MS Word | `_extensions/word-report/report_template2.docx` | `_extensions/word-report/report_template1.docx` |
| PDF report | `_extensions/report/` | `_extensions/old-report/` |
| PDF letter | `_extensions/letter/` | `_extensions/old-letter/` |

To use an old template, point the relevant `reference-doc` (PowerPoint/Word) or `format` (PDF report/letter, e.g. `old-report-pdf`, `old-letter-pdf`) at the old file or extension instead of the current one.

# Swiss TPH PowerPoint template

Step 1: Download all necessary files into your working directory. They must be located in the same folder.

- [ppt_template2.pptx](./ppt_template2.pptx)
- [ppt_report_demo.qmd](./ppt_report_demo.qmd)
- [\_ppt\_metadata.yml](./_ppt_metadata.yml)

Step 2: Open `ppt_report_demo.qmd` in RStudio. We recommend creating an R project (`.Rproj`) in the same directory to ensure your working directory is correctly set.

Step 3: Modify the `.qmd` file as needed. Be sure to update the file path of the example image to the correct location. For general guidance on using Quarto for PowerPoint, please refer to: [PowerPoint - Quarto](https://quarto.org/docs/presentations/powerpoint.html).

Step 4: Render the `.qmd` file and save the output `.pptx` file.

# Swiss TPH MS Word template

* NOTE for the Word template: Please avoid using this template together with landscape mode. There is an existing problem with cover page pictures showing with the use of landscape mode.

Step 1: Download the `_extensions/word-report/` folder into your working directory. **IMPORTANT**: Do not change the directory structure. The path to this folder must remain `./_extensions/word-report/` relative to your current working directory; otherwise, rendering will fail.

Step 2: Download the remaining required file into your working directory:

- [word_report_demo.qmd](./word_report_demo.qmd)

Step 3: Open `word_report_demo.qmd` in RStudio. We recommend creating an R project (`.Rproj`) in the same directory to ensure your working directory is correctly set.

Step 4: Modify the `.qmd` file as needed. For general guidance on using Quarto with MS Word, please refer to: [Word Basics - Quarto](https://quarto.org/docs/output-formats/ms-word.html).

Step 5: Render the `.qmd` file and save the output `.docx` file.

# Swiss TPH PDF report template

The PDF report template ships with two rendering engines: a **LaTeX** variant (`report-pdf`, demo `report_simple_demo.qmd`) and a **Typst** variant (`report-typst`, demo `report_simple_demo_typst.qmd`). Both live in `_extensions/report/`. Typst renders faster and needs no LaTeX installation; LaTeX offers more fine-grained typographic control.

Step 1: Download the `_extensions/report/` folder into your working directory. **IMPORTANT**: Do not change the directory structure. The path to this folder must remain `./_extensions/report/` relative to your current working directory; otherwise, rendering will fail.

Step 2: Download the remaining required files into your working directory:

- [report_simple_demo.qmd](./report_simple_demo.qmd) (LaTeX) or [report_simple_demo_typst.qmd](./report_simple_demo_typst.qmd) (Typst)
- [references.bib](./references.bib)

Step 3: Modify the `.qmd` file as needed. For general guidance, please refer to: [PDF Basics - Quarto](https://quarto.org/docs/output-formats/pdf-basics.html) (LaTeX) or [Typst - Quarto](https://quarto.org/docs/output-formats/typst.html) (Typst).

Step 4: You may replace `references.bib` with your own bibliography or remove it if you do not require references. If you remove it, make sure to delete the corresponding entry in the `.qmd` file.

Step 5: Render the `.qmd` file and save the output `.pdf` file.

# Swiss TPH PDF letter template

The PDF letter template ships with two rendering engines: a **LaTeX** variant (`letter-pdf`, demo `letter_demo.qmd`) and a **Typst** variant (`letter-typst`, demo `letter_demo_typst.qmd`). Both live in `_extensions/letter/`.

Step 1: Download the `_extensions/letter/` folder into your working directory. **IMPORTANT**: Do not change the directory structure. The path to this folder must remain `./_extensions/letter/` relative to your current working directory; otherwise, rendering will fail.

Step 2: Download the remaining required file into your working directory:

- [letter_demo.qmd](./letter_demo.qmd) (LaTeX) or [letter_demo_typst.qmd](./letter_demo_typst.qmd) (Typst)

Step 3: Modify the `.qmd` file as needed. Be sure to update the file path of the example image to the correct location. For general guidance, please refer to: [PDF Basics - Quarto](https://quarto.org/docs/output-formats/pdf-basics.html) (LaTeX) or [Typst - Quarto](https://quarto.org/docs/output-formats/typst.html) (Typst).

Step 4: Render the `.qmd` file and save the output `.pdf` file.
