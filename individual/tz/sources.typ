// Порядок: кириллица, латиница, по заглавию.
#let sources = (
  (id: "g101", body: [ГОСТ 19.101-77. Единая система программной документации. Виды программ и программных документов.]),
  (id: "g102", body: [ГОСТ 19.102-77. Единая система программной документации. Стадии разработки.]),
  (id: "g103", body: [ГОСТ 19.103-77. Единая система программной документации. Обозначение программ и программных документов.]),
  (id: "g104", body: [ГОСТ 19.104-78. Единая система программной документации. Основные надписи.]),
  (id: "g105", body: [ГОСТ 19.105-78. Единая система программной документации. Общие требования к программным документам.]),
  (id: "g106", body: [ГОСТ 19.106-78. Единая система программной документации. Требования к программным документам, выполненным печатным способом.]),
  (id: "g201", body: [ГОСТ 19.201-78. Единая система программной документации. Техническое задание. Требования к содержанию и оформлению.]),
  (id: "g301", body: [ГОСТ 19.301-79. Единая система программной документации. Программа и методика испытаний. Требования к содержанию и оформлению.]),
  (id: "g401", body: [ГОСТ 19.401-78. Единая система программной документации. Текст программы. Требования к содержанию и оформлению.]),
  (id: "g404", body: [ГОСТ 19.404-79. Единая система программной документации. Пояснительная записка. Требования к содержанию и оформлению.]),
  (id: "g504", body: [ГОСТ 19.504-79. Единая система программной документации. Руководство программиста. Требования к содержанию и оформлению.]),
  (id: "g603", body: [ГОСТ 19.603-78. Единая система программной документации. Общие правила внесения изменений.]),
  (id: "g604", body: [ГОСТ 19.604-78. Единая система программной документации. Правила внесения изменений в программные документы, выполненные печатным способом.]),
  (id: "eidos", body: [Роботизированная сварочная ячейка А12-PVHH-600 \[Электронный ресурс\] / Эйдос Робототехника. — URL: #link("https://eidos-robotics.ru/welding_a12-pvhh-600") (дата обращения: 14.11.2026).]),
  (id: "abb", body: [Cobot Arc Welding Package \[Электронный ресурс\] / ABB. — URL: #link("https://www.abb.com/global/en/areas/robotics/products/equipment/arc-welding/cobot-arc-welding-package") (дата обращения: 17.11.2026).]),
  (id: "zhou", body: [Path Planning with Automatic Seam Extraction over Point Cloud Models for Robotic Arc Welding \[Электронный ресурс\] / P. Zhou \[et al.\]. — 2020. — arXiv:2011.11951v1. — URL: #link("https://arxiv.org/abs/2011.11951v1") (дата обращения: 14.11.2026).]),
  (id: "path", body: [Path Robotics. Intelligent Welding Cells \[Электронный ресурс\]. — URL: #link("https://www.path-robotics.com/intelligent-welding-cells") (дата обращения: 15.11.2026).]),
  (id: "meng", body: [Point Cloud-Based Weld Seam Recognition and Localization for Robotic Welding / X.-L. Meng \[et al.\] /\/ Applied Sciences. — 2026. — Vol. 16, no. 17. — Art. 8879. — DOI: #link("https://doi.org/10.3390/app16178879")[10.3390/app16178879].]),
  (id: "smooth", body: [SmoothTool & SmoothTool X \[Электронный ресурс\] / Smooth Robotics. — URL: #link("https://smooth-robotics.com/smoothtool-product-page/") (дата обращения: 14.11.2026).]),
  (id: "abagy", body: [Step-by-step process for robotic welding with ABAGY \[Электронный ресурс\] / ABAGY. — 20.04.2022. — URL: #link("https://abagy.com/step-by-step-process") (дата обращения: 15.11.2026).]),
)

#let cite-source(id) = {
  let i = sources.map(s => s.id).position(x => x == id)
  assert(i != none, message: "Неизвестный источник: " + id)
  link(label("src-" + id), text("[" + str(i + 1) + "]"))
}

#let bibliography() = {
  set par(first-line-indent: 0pt, leading: 8.7pt, spacing: 6pt, justify: true)
  set enum(numbering: "1.", indent: 0pt, body-indent: 0.5em, spacing: 6pt)
  show enum.item: it => block(breakable: false, it)
  enum(..sources.map(s => [#s.body #label("src-" + s.id)]))
}
