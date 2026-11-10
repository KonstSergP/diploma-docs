#import "../../shared/titles.typ": individual-title
#import "../../shared/project.typ": project, designation
#import "../../shared/people.typ": author

// Вид документа и суффикс обозначения взяты из прошлогоднего комплекта.
// При необходимости переопределите title и другие поля project здесь.
#let meta = (
  ..project,
  title: individual-title,
  kind: "Техническое задание",
  code: designation + " ТЗ 02-1",
  authors: (author,),
)
