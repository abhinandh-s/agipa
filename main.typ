#import "layout/template.typ": html-page, nav
#import "layout/assets.typ": bundle-assets

#html-page("index.html", [Home])[
  #local-outline()
  // #outline(target: heading.where(bookmarked: false, outlined: true))

  This guide also exists as a #link(<book-pdf>)[single PDF].
  #nav(none, <foreword>)
] <home>

#html-page("foreword.html", [Foreword])[
  #include "foreword.typ"
  #nav(<home>, <introduction>)
] <foreword>

#html-page("introduction.html", [Introduction])[
  #include "chapters/introduction.typ"
  #nav(<foreword>, <registration>)
] <introduction>

#html-page("registration.html", [Registration])[
  #include "chapters/registration.typ"
  #nav(<rl>, <reconstitution>)
] <registration>

#html-page("reconstitution.html", [Reconstitution of Firm])[
  #include "chapters/reconstitution.typ"
  #nav(<registration>, <dissolution>)
] <reconstitution>

#html-page("dissolution.html", [Dissolution of Firm])[
  #include "chapters/dissolution.typ"
  #nav(<reconstitution>, <rl>)
] <dissolution>

#html-page("rights-and-liabilities.html", [Rights and Liabilities])[
  #include "chapters/rights-and-liabilities.typ"
  #nav(<dissolution>, none)
] <rl>

#let local-outline() = context {
  let doc = query(selector(document).before(here())).last()
  outline(target: selector(heading).within(doc.location()))
}

#document("ag.pdf", title: [Full Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Indian Partnership Act, 1932]
    #v(1em)
    Study Note
  ]
  #pagebreak()
  #set heading(numbering: "1.", bookmarked: true)
  #local-outline()
  // only work with no numbering 
  // #outline(target: heading.where(bookmarked: true, outlined: true))
  #pagebreak()
  #include "foreword.typ"
  #include "chapters/introduction.typ"
  #include "chapters/registration.typ"
  #include "chapters/reconstitution.typ"
  #include "chapters/dissolution.typ"
  #include "chapters/rights-and-liabilities.typ"
] <book-pdf>

#bundle-assets()