#import "../../template/document.typ": document
#import "../../template/components.typ": contents
#import "metadata.typ": meta

#show: document.with(meta: meta)

#include "sections/00-annotation.typ"

#contents()

#include "sections/01-introduction.typ"

#include "sections/02-purpose-and-scope.typ"

#include "sections/03-technical-characteristics.typ"

#include "sections/04-expected-indicators.typ"

#include "sections/05-generative-models.typ"

#include "sections/90-references.typ"

#include "sections/91-appendix.typ"
