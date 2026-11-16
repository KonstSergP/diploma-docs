#import "geometry.typ": furniture
#import "covers.typ": approval-sheet, title-sheet
#import "components.typ": registration-sheet
#let pdf-document = document

#let document(meta: (:), approval: true, registration: true, stamp: true,
  tables-breakable: true, body) = {
  set pdf-document(
    title: meta.title + " — " + meta.kind,
    author: meta.authors.map(x => x.name)
  )
  set page(paper: "a4", margin: 0pt)
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "ru",
    top-edge: 0.784em,
    bottom-edge: -0.216em,
    hyphenate: false,
    kerning: false
  )
  set par(
    justify: true,
    leading: 8.7pt,
    spacing: 12pt,
    first-line-indent: (amount: 12.5mm, all: true)
  )
  set block(above: 0pt, below: 0pt)

  if approval {
    page(background: none, header: none, footer: none)[
      #counter(page).update(0)
      #approval-sheet(meta)
    ]
  }
  page(background: none, header: none, footer: none)[
    #counter(page).update(1)
    #title-sheet(meta, approved: approval)
  ]

  set page(
    margin: (
      left: 20mm, 
      right: 10mm, 
      top: 25mm, 
      bottom: if stamp { 28mm } else { 15mm }
    ),
    background: furniture(meta.code, stamp: stamp), 
    header: none, 
    footer: none
  )
  set heading(numbering: "1.1.")
  show heading: it => {
    if it.level == 1 { pagebreak(weak: true) }
    block(
      width: 100%,
      above: if it.level == 1 { 0pt } else { 6pt },
      below: if it.level == 1 { 10pt } else { 6pt },
      sticky: true
    )[
      #let title = [
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.5em) 
        }
        #it.body
      ]
      #if it.level == 1 {
        align(center, upper(title)) 
      } else {
        pad(left: 12.5mm, title)
      }
    ]
  }
  show outline.entry: it => {
    set text(weight: "bold", hyphenate: false)
    set par(leading: 2pt, spacing: 4pt)
    it
  }

  set list(marker: [-], indent: 12.5mm, body-indent: 0.5em, spacing: 6pt)
  set enum(numbering: "1)", indent: 12.5mm, body-indent: 0.5em, spacing: 6pt)
  show list: it => block(above: 14.7pt, below: 14.7pt)[
    #set par(leading: 3.87pt)
    #it
  ]
  show enum: it => block(above: 14.7pt, below: 14.7pt)[
    #set par(leading: 3.87pt)
    #it
  ]

  set table(stroke: 0.5pt)
  show table: it => {
    set par(leading: 1.8pt, spacing: 0pt)
    it
  }
  set figure(gap: 6pt)
  show figure: it => block(
    width: 100%, 
    above: 8pt, 
    below: 8pt,
    breakable: if it.kind == table { tables-breakable } else { false },
    it
  )
  show figure.caption: set par(first-line-indent: 0pt, justify: false, leading: 1.8pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set align(left)
  show figure.where(kind: image): set figure(supplement: [Рисунок])
  set figure.caption(separator: " – ")

  body

  if registration {
    pagebreak()
    set page(margin: (left: 20mm, right: 10mm, top: 25mm, bottom: 15mm),
      background: none, header: none, footer: none)
    registration-sheet()
  }
}
