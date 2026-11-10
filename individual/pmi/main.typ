#import "../../template/document.typ": document
#import "../../template/components.typ": contents
#import "metadata.typ": meta

#show: document.with(meta: meta)

#include "sections/00-annotation.typ"

#contents()

#include "sections/01-test-object.typ"

#include "sections/02-test-purpose.typ"

#include "sections/03-software-requirements.typ"

#include "sections/04-documentation-requirements.typ"

#include "sections/05-test-procedure.typ"

#include "sections/06-test-methods.typ"

#include "sections/90-references.typ"
