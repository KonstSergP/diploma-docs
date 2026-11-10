#import "../../template/document.typ": document
#import "../../template/components.typ": contents
#import "metadata.typ": meta

#show: document.with(meta: meta)

#include "sections/00-annotation.typ"

#contents()

#include "sections/01-introduction.typ"

#include "sections/02-development-basis.typ"

#include "sections/03-purpose.typ"

#include "sections/04-software-requirements.typ"

#include "sections/05-documentation-requirements.typ"

#include "sections/06-technical-economic-indicators.typ"

#include "sections/07-development-stages.typ"

#include "sections/08-acceptance.typ"

#include "sections/90-references.typ"
