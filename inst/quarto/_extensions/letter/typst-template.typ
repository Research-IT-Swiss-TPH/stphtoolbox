
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


#let letter(
  title: none,
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
  TPH-logo: "_extensions/letter/SwissTPH_Logo_Screen_Indigo_rgb.png",
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
  sfirstname: none,
  slastname: none,
  semail: none,
  sphone: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: (
      top: mtop,
      bottom: mbottom,
      left: mleft,
      right: mright
    ),
    numbering: numbering,
    background: if TPH-logo != none {
      place(top + right, dx: -1cm, dy: 1cm, image(TPH-logo, width: 5cm))
    },
    footer: text(size: 9pt, fill: gray)[
      *Swiss TPH*, Kreuzstrasse 2, 4123 Allschwil, Switzerland #h(1fr) Associated Institute of the University of Basel \
      Phone +41 61 284 81 11, Fax +41 61 284 81 01, www.swisstph.ch
    ],
  )

  set text(font: font, size: fontsize)

  // Logo moved to set page(background:) so it appears on every page — old first-page-only block commented out
  // if TPH-logo != none {
  //   place(top + right, dy: -3.5cm, image(TPH-logo, width: 5cm))
  // }
  
  v(-2.5cm)
  grid(columns: (50%, 50%),
    align: (left, left),
    box()[
      #set text(fill: gray)
      #text(weight: "bold")[#sfirstname #slastname]
      #v(-3mm)
      #text()[#semail.replace("\\@", "@")] // Avoid Pandoc escaping
      #v(-3mm)
      #text()[#sphone]
    ]
  )
  v(2.5cm)
  
  set par(justify: true)
  set heading(numbering: sectionnumbering)
  
  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
