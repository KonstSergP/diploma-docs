#import "geometry.typ": at, inventory-strip

#let approval-code(meta) = meta.at("approval-code", default: meta.code + "-ЛУ")
#let cover-text(body) = {
  set par(first-line-indent: 0pt, justify: false, leading: 1.8pt, spacing: 0pt)
  body
}
#let cover-center(y, body, size: 12pt) = at(69.42pt, y, 503pt,
  align(center, text(size: size, weight: "bold", body)))

#let approval-sheet(meta) = cover-text({
  inventory-strip(377.7pt)
  at(56.7pt, 58.6pt, 511.22pt, align(center, strong(meta.institution)))
  at(56.7pt, 141.4pt, 511.22pt, align(center)[#meta.faculty\ #meta.program])
  at(76pt, 205.1pt, 240pt, align(center)[СОГЛАСОВАНО\ #meta.supervisor.role])
  at(326pt, 205.1pt, 238pt, align(center)[УТВЕРЖДАЮ\ #meta.approver.role])
  at(76pt, 288.8pt, 240pt, align(center)[#text(size: 13.02pt)[\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_] #meta.supervisor.name])
  at(76pt, 317.3pt, 240pt, align(center, text(size: 13.02pt)[«\_\_\_» \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ #meta.year г.]))
  at(326pt, 316.4pt, 238pt, align(center)[#text(size: 13.02pt)[\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_] #meta.approver.name])
  at(326pt, 345.5pt, 238pt, align(center, text(size: 13.02pt)[«\_\_\_» \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ #meta.year г.]))
  cover-center(401.7pt, upper(meta.title))
  cover-center(443.4pt, meta.kind, size: 14pt)
  cover-center(471pt, [ЛИСТ УТВЕРЖДЕНИЯ], size: 14pt)
  cover-center(500.9pt, approval-code(meta), size: 14pt)
  at(330pt, 572pt, 210pt, align(center)[
    #if meta.authors.len() == 1 [Исполнитель:] else [Исполнители:]\
    #for person in meta.authors [
      #person.role\
      \_\_\_\_\_\_\_\_\_ / #person.name /\
      «\_\_\_\_» \_\_\_\_\_\_\_\_\_\_\_ #meta.year г.\
    ]
  ])
  at(56.7pt, 781.8pt, 511.22pt, align(center, text(size: 14pt, weight: "bold", [#meta.city #meta.year])))
})

#let title-sheet(meta) = cover-text({
  inventory-strip(289.5pt)
  at(69.42pt, 59.1pt, 260pt, align(center, text(size: 14pt)[УТВЕРЖДЕН]))
  at(57.5pt, 75.3pt, 250pt, align(center, text(size: 14pt, approval-code(meta))))
  cover-center(229.1pt, upper(meta.title))
  cover-center(257pt, meta.kind, size: 14pt)
  cover-center(286.9pt, meta.code, size: 14pt)
  context cover-center(319.1pt, [Листов #counter(page).final().first()], size: 14pt)
  at(56.7pt, 773.6pt, 511.22pt, align(center, text(size: 14pt, weight: "bold", [#meta.city #meta.year])))
})
