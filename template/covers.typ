#import "geometry.typ": at, inventory-strip, body-width

#let approval-code(meta) = meta.at("approval-code", default: meta.code + "-ЛУ")
#let signer-name(person) = {
  let parts = person.name.split().filter(x => x != "")
  person.at("signature-name", default:
    if parts.len() > 1 { parts.slice(1).map(x => x.first() + ".").join(" ") + " " + parts.first() }
    else { person.name })
}

#let signature(name, slashes: true, line-width: 27mm) = [#box(width: line-width, line(length: line-width, stroke: 0.4pt)) #if slashes { [\/ #name \/] } else { name }]
#let date-line(year) = [«\_\_\_» \_\_\_\_\_\_\_\_\_\_\_\_ #year г.]

#let cover(meta, approval: false, approved: true) = {
  set par(first-line-indent: 0pt, justify: false, leading: 1.8pt, spacing: 0pt)
  set text(hyphenate: false)
  inventory-strip(if approval { 133mm } else { 102mm })
  let code = approval-code(meta)
  if approval {
    at(20mm, 20mm, body-width, align(center, strong(meta.institution)))
    at(20mm, 51mm, body-width, align(center)[#meta.faculty\
      #meta.program])
    at(25mm, 72mm, 83mm, align(center)[СОГЛАСОВАНО\ #meta.supervisor.role])
    at(115mm, 72mm, 83mm, align(center)[УТВЕРЖДАЮ\ #meta.approver.role])
    at(25mm, 110mm, 83mm, align(center, signature(meta.supervisor.name, slashes: false)))
    at(115mm, 110mm, 83mm, align(center, signature(meta.approver.name, slashes: false)))
    at(25mm, 120mm, 83mm, align(center, date-line(meta.year)))
    at(115mm, 120mm, 83mm, align(center, date-line(meta.year)))
    at(25mm, 143mm, 175mm, align(center)[
      #strong(upper(meta.title))
      #v(8mm)
      *#meta.kind*
      #v(6mm)
      *ЛИСТ УТВЕРЖДЕНИЯ*
      #v(4mm)
      *#code*
    ])
    if meta.authors.len() == 1 {
      at(120mm, 214mm, 78mm, align(center)[
        Исполнитель\
        #meta.authors.first().role
        #v(2mm)
        #signature(meta.at("signature-name", default: signer-name(meta.authors.first())), line-width: 20mm)
        #v(2mm)
        #date-line(meta.year)
      ])
    } else {
      at(25mm, 214mm, 175mm, [
        #align(center)[Исполнители]
        #v(4mm)
        #grid(columns: (1fr,) * meta.authors.len(), gutter: 4mm,
          ..meta.authors.map(person => align(center)[
            #person.role
            #v(2mm)
            #signature(signer-name(person), line-width: 20mm)
            #v(2mm)
            #date-line(meta.year)
          ]))
      ])
    }
  } else {
    if approved { at(20mm, 20mm, 95mm, align(center)[УТВЕРЖДЕН\ #code]) }
    at(25mm, 81mm, 175mm, align(center)[
      #strong(upper(meta.title))
      #v(9mm)
      *#meta.kind*
      #v(6mm)
      *#meta.code*
      #v(6mm)
      *#context [Листов #counter(page).final().first()]*
    ])
  }
  at(20mm, 276mm, body-width, align(center)[*#meta.city #meta.year*])
}

#let approval-sheet(meta) = cover(meta, approval: true)
#let title-sheet(meta, approved: true) = cover(meta, approved: approved)
