#import "../../template/document.typ": document
#import "../../template/components.typ": contents
#import "metadata.typ": meta

#show: document.with(meta: meta)

#include "sections/00-annotation.typ"

#include "sections/01-program-source.typ"

#include "sections/90-references.typ"
