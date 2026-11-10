#import "../../shared/titles.typ": common-title
#import "../../shared/project.typ": project, designation

// Вид документа и суффикс обозначения взяты из прошлогоднего комплекта.
// При необходимости переопределите title и другие поля project здесь.
#let meta = (
  ..project,
  title: common-title,
  kind: "Программа и методика испытаний",
  code: designation + " 51 01-1",
  authors: project.authors,
)
