#import "../../shared/titles.typ": individual-title
#import "../../shared/project.typ": project, designation
#import "../../shared/people.typ": author

// Вид документа и суффикс обозначения взяты из прошлогоднего комплекта.
// При необходимости переопределите title и другие поля project здесь.
#let meta = (
  ..project,
  title: individual-title,
  kind: "Программа и методика испытаний",
  code: designation + " 51 02-1",
  authors: (author,),
)
