// Размеры сняты с PDF «Общее ТЗ», экспортированного из Word.
// Все координаты в пунктах относительно верхнего левого угла A4.
#let paper-width = 595.32pt
#let paper-height = 841.92pt
#let body-left = 56.7pt
#let body-width = 511.22pt
#let at(x, y, width, body) = place(top + left, dx: x, dy: y,
  block(width: width, above: 0pt, below: 0pt, body))

#let inventory-strip(y) = {
  let heights = (100.1pt, 71.4pt, 71.4pt, 83.8pt, 71.4pt)
  let labels = ("Подп. и дата", "Инв. № дубл.", "Взам. инв. №", "Подп. и дата", "Инв. № подл.")
  let current = y
  for (i, height) in heights.enumerate() {
    at(26.1pt, current, 43.2pt, grid(
      columns: (23.4pt, 19.8pt), rows: (height,), stroke: 0.48pt,
      align: center + horizon,
      rotate(-90deg, reflow: true, text(size: 10pt, weight: "bold", style: "italic", labels.at(i))),
      [],
    ))
    current += height
  }
}

#let change-stamp(code) = {
  let xs = (57.18pt, 226.82pt, 312.52pt, 397.60pt, 482.70pt, 567.74pt)
  let ys = (768.46pt, 782.68pt, 799.48pt, 813.76pt, 827.92pt)
  for y in ys { at(xs.first(), y, 510.56pt, line(length: 510.56pt, stroke: 0.48pt)) }
  for x in xs { at(x, ys.first(), 0pt, line(end: (0pt, 59.46pt), stroke: 0.48pt)) }
  for (row, labels) in (
    ("Изм.", "Лист", "№ докум.", "Подп.", "Дата"),
    ("Инв. № подл.", "Подп. и дата", "Взам. инв. №", "Инв. № дубл.", "Подп. и дата"),
  ).enumerate() {
    let y = (784.73pt, 814.67pt).at(row)
    for (i, label) in labels.enumerate() {
      at(xs.at(i), y, xs.at(i+1)-xs.at(i), align(center, label))
    }
  }
  at(60pt, 800.09pt, 163pt, align(center, text(size: 12pt, code)))
}

#let furniture(code) = {
  set par(first-line-indent: 0pt, justify: false, leading: 1.8pt, spacing: 0pt)
  context at(body-left, 23.652pt, body-width, align(center, strong(counter(page).display("1"))))
  at(body-left, 37.452pt, body-width, align(center, strong(code)))
  change-stamp(code)
}
