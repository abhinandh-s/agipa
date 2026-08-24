#import "@local/ui:0.1.0": *

#let local-outline() = context {
  let doc = query(selector(document).before(here())).last()
  outline(target: selector(heading).within(doc.location()))
}

#webpage("index.html", [Home], pdf-path: "ipa.pdf")[
  #outline(target: heading.where(bookmarked: false, outlined: true))

  This guide also exists as a #link(<book-pdf>)[single PDF].
  #nav(none, <foreword>)
] <home>

#webpage("foreword.html", [Foreword], pdf-path: "ipa.pdf")[
  #include "foreword.typ"
  #nav(<home>, <introduction>)
] <foreword>

#webpage("introduction.html", [Introduction], pdf-path: "ipa.pdf")[
  #include "chapters/introduction.typ"
  #nav(<foreword>, <registration>)
] <introduction>

#webpage("registration.html", [Registration], pdf-path: "ipa.pdf")[
  #include "chapters/registration.typ"
  #nav(<rl>, <reconstitution>)
] <registration>

#webpage("reconstitution.html", [Reconstitution of Firm], pdf-path: "ipa.pdf")[
  #include "chapters/reconstitution.typ"
  #nav(<registration>, <dissolution>)
] <reconstitution>

#webpage("dissolution.html", [Dissolution of Firm], pdf-path: "ipa.pdf")[
  #include "chapters/dissolution.typ"
  #nav(<reconstitution>, <rl>)
] <dissolution>

#webpage("rights-and-liabilities.html", [Rights and Liabilities], pdf-path: "ipa.pdf")[
  #include "chapters/rights-and-liabilities.typ"
  #nav(<dissolution>, none)
] <rl>

#document("ipa.pdf", title: [Full Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Indian Partnership Act, 1932]
    #v(1em)
    Study Note
  ]
  #pagebreak()
  #set heading(numbering: "1.", bookmarked: true)
  #counter(heading).update(0)
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


#asset("favicon.ico", read("/images/favicon.ico", encoding: none))
