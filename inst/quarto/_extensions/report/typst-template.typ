
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
  paper: "a4",
  lang: "en",
  region: "US",
  font: "Aptos",
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  numbering: none,
  TPH-icon: "_extensions/report/SwissTPH_icon_typst.png",
  TPH-logo: "_extensions/report/SwissTPH_Logo_Screen_Indigo_rgb.png",
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
    numbering: none,
  )

  // Set the body font
  set text(font: font, size: fontsize)

  // Links should be Swiss TPH indigo
  show link: set text(rgb(67, 44, 161))

  // Headings should be Swiss TPH indigo
  show heading: set text(rgb(67, 44, 161))

  // Tables should be breakable
  show figure: set block(breakable: true)

  // Swiss TPH icon on top left
  if TPH-icon != none {
    place(top + left, dx: -4cm, dy: -0.5cm, image(TPH-icon, width: 21.6cm))
  }

  // Swiss TPH logo on bottom right
  if TPH-logo != none {
    place(top + left, dx: 12cm, dy: 26.5cm, image(TPH-logo, width: 4cm))
  }

  v(7cm)
  // Date above the title
  if date != none {
    align(left, text(11pt, rgb(0, 0, 0), date))
    v(0.3cm)
  }
  // Title and authors
  if title != none {
    align(left, text(20pt, rgb(67, 44, 161), weight: 800, title))
  }
  v(1cm)
  if additional1 != none {
    align(left, text(20pt, rgb(67, 44, 161), weight: 800, additional1))
  }
  if additional2 != none {
    align(left, text(20pt, rgb(67, 44, 161), weight: 800, additional2))
  }
  if subtitle != none {
    align(left, text(20pt, rgb(0, 0, 0), subtitle))
  }
  if projectname != none {
    align(left, text(20pt, rgb(0, 0, 0), projectname))
  }
  if authors != none {
    for author in authors {
      if author.name != none{
        align(left, text(weight: 800, author.name))
      }
      if author.affiliation != none {
        align(left, text(author.affiliation))
      }
      if author.name != none{
        align(left, text(fill: rgb(67, 44, 161), author.email))
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
