#let body-width = 180mm

#let at(x, y, width, body) = place(
  top + left,
  dx: x,
  dy: y,
  block(
    width: width,
    above: 0pt,
    below: 0pt,
    body,
  ),
)

#let inventory-strip(y) = {
  let heights = (100.1pt, 71.4pt, 71.4pt, 83.8pt, 71.4pt)
  let labels = ("Подп. и дата", "Инв. № дубл.", "Взам. инв. №", "Подп. и дата", "Инв. № подл.")
  let current = y
  for (i, height) in heights.enumerate() {
    at(26.1pt, current, 43.2pt, grid(
      columns: (23.4pt, 19.8pt), 
      rows: (height,), 
      stroke: 0.48pt,
      align: center + horizon,
      rotate(
        -90deg, 
        reflow: true, 
        text(size: 10pt, weight: "bold", style: "italic", labels.at(i))
        ),
      []
      )
    )
    current += height
  }
}

#let furniture(code, stamp: true) = {
  set text(size: 12pt, weight: "regular")
  set par(first-line-indent: 0pt, justify: false, leading: 1.8pt, spacing: 0pt)
  strong(context at(20mm, 8mm, body-width, align(center, counter(page).display("1"))))
  at(20mm, 13mm, body-width, align(center, strong(code)))
  if stamp {
    at(20mm, 272mm, body-width, {
      set text(size: 9pt)
      table(columns: (60mm, 30mm, 30mm, 30mm, 30mm), rows: (5mm,) * 4,
        stroke: 0.5pt, inset: (x: 1mm, y: 0.5mm), align: center + horizon,
        [], [], [], [], [],
        [Изм.], [Лист], [№ докум.], [Подп.], [Дата],
        [#code], [], [], [], [],
        [Инв. № подл.], [Подп. и дата], [Взам. инв. №], [Инв. № дубл.], [Подп. и дата],
      )
    })
  }
}
