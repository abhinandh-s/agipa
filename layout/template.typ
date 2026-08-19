#import "icons.typ": *

#let init-theme-script = html.script("
  let savedTheme = localStorage.getItem('theme');
  if (!savedTheme) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    savedTheme = prefersDark ? 'dark' : 'light';
  } 
  document.documentElement.setAttribute('data-theme', savedTheme);
")

#let layout-fixes-script = html.script("
  document.addEventListener('DOMContentLoaded', function() {
    const nav = document.querySelector('.bottom-nav');
    const endnotes = document.querySelector('section[role=\"doc-endnotes\"]');
    
    if (endnotes) {
      const divider = document.createElement('hr');
      divider.className = 'footnotes-divider';
      endnotes.insertAdjacentElement('beforebegin', divider);
      
      if (nav) {
        endnotes.insertAdjacentElement('afterend', nav);
      }
    } else if (nav) {
      document.body.appendChild(nav);
    }
  });
")

#let external-assets = [
  #html.elem("link", attrs: (rel: "stylesheet", href: "css/style.css"))
  #html.script(src: "js/sidebar.js")
  #html.script(src: "js/theme.js")
  #html.script(src: "js/comment-box.js")
]

#let top-bar-nav = html.elem("div", attrs: (class: "top-bar"))[
  #html.button(id: "sidebar-toggle", class: "btn icon-btn")[
    #icon-menu
  ]
  #html.elem("div", attrs: (class: "top-bar-right"))[
    #html.elem("a", attrs: (href: "ag.pdf", class: "btn icon-btn", target: "_blank", title: "Download PDF"))[
      #icon-pdf
    ]
    #html.button(id: "theme-toggle", class: "btn icon-btn")[
      #icon-palette
    ]
  ]
]

#let theme = [
  #init-theme-script
  #layout-fixes-script
  #external-assets
  #top-bar-nav
]

#let local-outline() = context {
  let doc = query(selector(document).before(here())).last()
  outline(target: selector(heading).within(doc.location()))
}

#let html-page(filename, page-title, body) = {
  document(filename, title: page-title)[
    #theme
    #set heading(numbering: "1.", bookmarked: false)

    #html.elem("nav", attrs: (id: "sidebar"))[
      #local-outline()
      // #outline(target: heading.where(bookmarked: false, outlined: true))
    ]

    #html.elem("main", attrs: (id: "content"))[
      #body
    ]
  ]
}

#let prev(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[#icon-prev]
]

#let next(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[#icon-next]
]

#let nav(p, n) = html.elem("div", attrs: (class: "bottom-nav"))[
  #if p != none [ #prev(p) ] else [ #html.elem("span")[] ]
  #if n != none [ #next(n) ] else [ #html.elem("span")[] ]
]
