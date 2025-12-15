// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template
// that ships with Quarto). It calls the typst function named 'article' which
// is defined in the 'typst-template.typ' file.
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: doc => report(
$if(title)$
  title: [$title$],
$endif$
$if(additional1)$
  additional1: [$additional1$],
$endif$
$if(additional2)$
  additional2: [$additional2$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(projectname)$
  projectname: [$projectname$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
  abstract-title: "$labels.abstract$",
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(toc-indent)$
  toc_indent: $toc-indent$,
$endif$
$if(TPH-logo)$
  TPH-logo: "$TPH-logo$",
$endif$
$if(TPH-icon)$
  TPH-icon: "$TPH-icon$",
$endif$
  toc_depth: $toc-depth$,
  cols: $if(columns)$$columns$$else$1$endif$,
  mtop: $margin.top$,
  mbottom: $margin.bottom$,
  mright: $margin.right$,
  mleft: $margin.left$,
  pfirstname: "$first_name$",
  plastname: "$last_name$",
  pstreet: "$street$",
  phnumber: "$house_number$",
  pzip: "$zip$",
  pcity: "$city$",
  sname: "$sender.name$",
  sposition: "$sender.position$",
  sinstitute: "$sender.institute$",
  saddress: "$sender.address$",
  swebsite: "$sender.website$",
  doc,
)
