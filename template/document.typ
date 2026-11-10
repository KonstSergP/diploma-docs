#import "geometry.typ": paper-width, paper-height, furniture, at
#import "covers.typ": approval-sheet, title-sheet
#import "components.typ": registration-sheet

#let pdf-metadata = document

// Общий профиль ЕСПД, визуально согласованный с образцом «Общее ТЗ».
// Не является шаблоном основного текста ВКР по ГОСТ НИР.
#let document(meta: (:), approval: true, registration: true, body) = {
  set pdf-metadata(title: meta.title + " — " + meta.kind, author: meta.authors.map(a => a.name))
  set page(width: paper-width, height: paper-height, margin: 0pt)
  set text(font: "Times New Roman", size: 12pt, lang: "ru",
    top-edge: 0.784em, bottom-edge: -0.216em,
    hyphenate: false, kerning: false, ligatures: false)
  set par(justify: true, leading: 8.7pt, spacing: 14.7pt,
    first-line-indent: (amount: 12.5mm, all: true))
  set block(above: 0pt, below: 0pt)

  if approval {
    page(background: none, header: none, footer: none)[
      #counter(page).update(0)
      #approval-sheet(meta)
    ]
  }
  page(background: none, header: none, footer: none)[
    #counter(page).update(1)
    #title-sheet(meta)
  ]

  set page(margin: (left: 56.7pt, right: 27.4pt, top: 65.052pt, bottom: 85pt),
    background: furniture(meta.code), header: none, footer: none)
  set heading(numbering: "1.1.")
  show heading: it => {
    if it.level == 1 { pagebreak(weak: true) }
    block(width: 100%, above: if it.level == 1 { 0pt } else { 6pt },
      below: if it.level == 1 { 10pt } else { 14.7pt }, sticky: true)[
      #set text(size: 12pt, weight: "bold", hyphenate: false)
      #set par(first-line-indent: 0pt, justify: false, leading: 8.7pt, spacing: 0pt)
      #let title = [#if it.numbering != none { counter(heading).display(it.numbering); h(0.5em) }#it.body]
      #if it.level == 1 { align(center, upper(title)) } else { pad(left: 12.5mm, title) }
    ]
  }
  show outline.entry: it => {
    set text(weight: "bold")
    set par(first-line-indent: 0pt, justify: false, leading: 2pt, spacing: 6pt)
    it
  }
  set list(marker: [–], indent: 12.5mm, body-indent: 0.5em, spacing: 6pt)
  set enum(numbering: "1)", indent: 12.5mm, body-indent: 0.5em, spacing: 6pt)
  show list: it => block(width: 100%, above: 6pt, below: 14.7pt, it)
  show enum: it => block(width: 100%, above: 6pt, below: 14.7pt, it)
  show table: it => {
    set par(first-line-indent: 0pt, justify: false, leading: 1.8pt, spacing: 0pt)
    it
  }
  set figure(gap: 6pt)
  show figure: it => block(width: 100%, above: 14.7pt, below: 14.7pt, it)
  show figure.caption: set par(first-line-indent: 0pt, justify: false, leading: 1.8pt)
  show figure.caption: set text(size: 12pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set align(left)
  show figure.where(kind: image): set figure(supplement: [Рисунок])
  set figure.caption(separator: [ — ])

  body

  if registration {
    page(margin: 0pt, background: none, header: none, footer: none)[
      #at(56.7pt, 56.7pt, 524pt, registration-sheet())
    ]
  }
}
