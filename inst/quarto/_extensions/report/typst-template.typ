
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find
// documentation on creating typst templates and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

// Swiss TPH colors:
// https://intranet.swisstph.ch/fileadmin/user_upload/AoC/Communications/Documents/CI-CD_Flyer_2020_FINAL.pdf

#let report(
  title: none,
  additional1: none,
  additional2: none,
  subtitle: none,
  projectname: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: none,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  numbering: none,
  TPH-icon: none,
  TPH-logo: none,
  mtop: none,
  mbottom: none,
  mleft: none,
  mright: none,
  pfirstname: none,
  plastname: none,
  pstreet: none,
  phnumber: none,
  pzip: none,
  pcity: none,
  sname: none,
  sposition: none,
  sinstitute: none,
  saddress: none,
  swebsite: none,
  doc,
) = {
  // Page setting for cover page
  set page(
    paper: paper,
    margin: (
      top: 5mm,
      bottom: mbottom,
      left: 40mm,
      right: mright
    ),
    numbering: numbering,
  )

  // Set the body font
  set text(11pt, font: "Arial")

  // Links should be Swiss TPH blue
  show link: set text(rgb(70, 138, 178))

  // Headings should be Swiss TPH blue
  show heading: set text(rgb(70, 138, 178))

  // Swiss TPH icon on top left
  context {
    set align(left)
    if TPH-icon != none {
      let img = image(TPH-icon, width: 7cm)
      let img-size = measure(img)

      grid(
        columns: img-size.width,
        rows: img-size.height,
        move(dx: -6cm, img),
      )
    }
  }

  // Swiss TPH 4-line logo on bottom right
  context {
    set align(left)
    if TPH-logo != none {
      let img = image(TPH-logo, width: 4cm)
      let img-size = measure(img)

      grid(
        columns: img-size.width,
        rows: img-size.height,
        move(dx: 12cm, dy: 15.5cm, img),
      )
    }
  }

  v(-3cm)
  // Title and authors
  if title != none {
    align(left, text(20pt, rgb(70, 138, 178), weight: 800, title))
  }
  v(1cm)
  if additional1 != none {
    align(left, text(20pt, rgb(70, 138, 178), weight: 800, additional1))
  }
  if additional2 != none {
    align(left, text(20pt, rgb(70, 138, 178), weight: 800, additional2))
  }
  if subtitle != none {
    align(left, text(20pt, rgb(191, 50, 39), subtitle))
  }
  if projectname != none {
    align(left, text(20pt, rgb(191, 50, 39), projectname))
  }
  if authors != none {
    for author in authors {
      if author.name != none{
        align(left, text(weight: 800, author.name))
      }
      if author.affiliation != none {
        align(left, text(author.affiliation))
      }
    }
  }

  set par(justify: true)
  set heading(numbering: sectionnumbering)
  set page(
    paper: paper,
    margin: (
      top: mtop,
      bottom: mbottom,
      left: mleft,
      right: mright
    ),
    numbering: numbering,
  )

  outline()

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
