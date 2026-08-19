#import "layout/template.typ": html-page, nav
#import "layout/assets.typ": bundle-assets

#html-page("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))

  This guide also exists as a #link(<book-pdf>)[single PDF].
  #nav(none, <foreword>)
] <home>

#html-page("foreword.html", [Foreword])[
  #include "foreword.typ"
  #nav(<home>, <introduction>)
] <foreword>

#html-page("introduction.html", [Introduction])[
  #title()
  #include "chapters/introduction.typ"
  #nav(<foreword>, <registration>)
] <introduction>

#html-page("registration.html", [Registration])[
  #title()
  #include "chapters/registration.typ"
  #nav(<rl>, <reconstitution>)
] <registration>

#html-page("reconstitution.html", [Reconstitution of Firm])[
  #title()
  #include "chapters/reconstitution.typ"
  #nav(<registration>, <dissolution>)
] <reconstitution>

#html-page("dissolution.html", [Dissolution of Firm])[
  #title()
  #include "chapters/dissolution.typ"
  #nav(<reconstitution>, <rl>)
] <dissolution>

#html-page("rights-and-liabilities.html", [Rights and Liabilities])[
  #title()
  #include "chapters/rights-and-liabilities.typ"
  #nav(<dissolution>, none)
] <rl>

// PDF Output
#document("ag.pdf", title: [Full Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)

  #align(center)[
    #text(24pt, weight: "bold")[Example Book]
    #v(1em)
    A demonstration book built with Typst.
  ]
  #pagebreak()
  #set heading(bookmarked: true)
  #outline(target: heading.where(bookmarked: true, outlined: true))
  #pagebreak()
  #include "foreword.typ"
  #include "chapters/introduction.typ"
  #include "chapters/registration.typ"
  #include "chapters/reconstitution.typ"
  #include "chapters/dissolution.typ"
  #include "chapters/rights-and-liabilities.typ"
] <book-pdf>

#bundle-assets()