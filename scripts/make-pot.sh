#!/bin/bash

project_path="../coviduci"
locale_path="${project_path}/locale"

pot_file="messages.pot"

# create .pot file
find ${project_path} -iname "*.html" -o -iname "*.py" | xargs \
    xgettext --output="${locale_path}/${pot_file}" --language=Python --from-code=UTF-8 \
    --sort-by-file --keyword=_ --keyword=_:1,2 --no-wrap
