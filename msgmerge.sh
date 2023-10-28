#!/bin/bash

# find electrum_dash -type f -name '*.py' -o -name '*.kv' > app.fil
# xgettext -s --from-code UTF-8 --language Python --no-wrap -f app.fil --output=messages.pot

for ldir in locale/*/
do
    ldir=${ldir%*/}
    ldir=${ldir##*/}
    msgmerge locale/${ldir}/electrum.po locale/messages.pot > electrum.po
    mv electrum.po locale/${ldir}/
    msgfmt --output-file=locale/${ldir}/electrum.mo  locale/${ldir}/electrum.po
done
