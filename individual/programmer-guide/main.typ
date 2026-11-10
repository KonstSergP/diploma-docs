#import "../../template/document.typ": document
#import "../../template/components.typ": contents
#import "metadata.typ": meta

#show: document.with(meta: meta)

#include "sections/00-annotation.typ"

#contents()

#include "sections/01-program-purpose.typ"

#include "sections/02-program-characteristics.typ"

#include "sections/03-usage.typ"

#include "sections/04-input-output.typ"

#include "sections/05-messages.typ"

#include "sections/90-references.typ"
