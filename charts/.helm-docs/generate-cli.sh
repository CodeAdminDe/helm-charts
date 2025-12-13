#!/bin/bash
$(which helm-docs) --chart-search-root=charts \
  --template-files=./.helm-docs/definitions/atom/_definitions.gotmpl \
    --template-files=./.helm-docs/definitions/atom/_valuetypes.gotmpl \
    --template-files=./.helm-docs/definitions/chart/_override_valuesTableHtml.gotmpl \
    --template-files=./.helm-docs/definitions/readme/README.md.default-template.gotmpl \
    --template-files=./.helm-docs/definitions/readme/README.md.complexvalues-template.gotmpl \
    --template-files=./.helm-docs/definitions/readme/README.md.lib-template.gotmpl \
    --template-files=./.helm-docs/templates/parts/header.gotmpl \
    --template-files=./.helm-docs/templates/parts/main.gotmpl \
    --template-files=./.helm-docs/templates/parts/footer.gotmpl \
    --template-files=./.helm-docs/templates/parts/libmain.gotmpl \
    --template-files=./.helm-docs/templates/parts/libfooter.gotmpl \
    --template-files=README.md.gotmpl
