#import "../../shared/people.typ": petrov, chubenko, leonov
#import "../../shared/titles.typ": common-title
#import "../../shared/project.typ": project

#let meta = (
  ..project,
  title: common-title,
  kind: "Техническое задание",
  code: project.designation + " ТЗ 01-1",
  authors: (petrov, chubenko, leonov),
)
