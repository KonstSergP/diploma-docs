
#let unnumbered(title, outlined: true) = heading(level: 1, numbering: none, outlined: outlined, title)

#let contents() = {
  unnumbered(outlined: false)[СОДЕРЖАНИЕ]
  set outline.entry(fill: repeat(text(weight: "regular", [.])) )
  pad(left: 12.5mm, outline(title: none, indent: 4mm, depth: 3))
}

#let registration-sheet() = {
  heading(level: 1, numbering: none)[Лист регистрации изменений]
  set text(size: 10pt, hyphenate: false)
  let cell = table.cell
  table(
    columns: (10mm, 18mm, 18mm, 16mm, 23mm, 20mm, 20mm, 29mm, 13mm, 13mm),
    rows: (12mm, 28mm) + (9mm,) * 20,
    stroke: 0.5pt, inset: 1mm, align: center + horizon,
    cell(rowspan: 2)[Изм.], cell(colspan: 4)[Номера листов (страниц)],
    cell(rowspan: 2)[Всего листов (страниц) в документе],
    cell(rowspan: 2)[№ документа],
    cell(rowspan: 2)[Входящий № сопроводительного документа и дата],
    cell(rowspan: 2)[Подп.], cell(rowspan: 2)[Дата],
    ..("Изменённых", "Заменённых", "Новых", "Аннулированных").map(x =>
      rotate(-90deg, reflow: true, box(x))),
    ..range(200).map(_ => []),
  )
}

#let appendix(title, number: 1) = {
  pagebreak(weak: true)
  show heading: it => block(width: 100%, below: 10pt, sticky: true)[
    #set par(first-line-indent: 0pt, justify: false)
    #align(right, strong(it.body))
  ]
  heading(level: 1, numbering: none)[ПРИЛОЖЕНИЕ #number]
  block(width: 100%, below: 14.7pt, sticky: true)[
    #set par(first-line-indent: 0pt, justify: false)
    #align(center, strong(upper(title)))
  ]
}
