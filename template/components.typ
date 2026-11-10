// Заголовок ненумерованного раздела: аннотация, источники и т. п.
#let unnumbered(title, outlined: true) = heading(level: 1, numbering: none, outlined: outlined, title)

#let contents() = {
  heading(level: 1, numbering: none, outlined: false)[СОДЕРЖАНИЕ]
  set outline.entry(fill: repeat(text(weight: "regular", [.])) )
  pad(left: 12.5mm, outline(title: none, indent: 4mm, depth: 3))
}

// Таблица регистрации — отдельная последняя страница без колонтитулов.
#let registration-sheet() = {
  set par(first-line-indent: 0pt, justify: false, leading: 8.7pt, spacing: 0pt)
  set text(size: 12pt, weight: "regular")
  let cell = table.cell
  table(
    columns: (36pt, 30pt, 36pt, 36pt, 66pt, 54pt, 69pt, 117pt, 43pt, 36pt),
    rows: (29pt, 27pt, 83pt) + (27.2pt,) * 17,
    stroke: 0.48pt, inset: 3pt, align: center + horizon,
    cell(colspan: 10)[*ЛИСТ РЕГИСТРАЦИИ ИЗМЕНЕНИЙ*],
    cell(colspan: 5)[Номера листов (страниц)],
    cell(rowspan: 2)[Всего листов (страниц) в докум.],
    cell(rowspan: 2)[№ документа],
    cell(rowspan: 2)[Входящий № сопроводительного докум. и дата],
    cell(rowspan: 2, align: top + center)[Подп.],
    cell(rowspan: 2, align: top + center)[Дата],
    ..("Изм.", "Изменённых", "Заменённых", "Новых", "Аннулированных").map(label =>
      rotate(-90deg, reflow: true, text(size: 10pt, label))),
    ..range(170).map(_ => []),
  )
}

// Заготовка приложения: на новой странице, обозначение справа,
// тематический заголовок по центру. Нумерация рисунков/таблиц пока общая.
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
