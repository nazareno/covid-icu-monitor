#!/bin/bash

project_path="../coviduci"
locale_path="${project_path}/locale"

declare -a languages=( "ar" "de" "es" "fr" "it" "ja" "pt" "ru" "zh" )

for lang in "${languages[@]}"
do
  lang_path="${locale_path}/${lang}"
  echo "Compiling ${lang_path}/messages.po..."
  po_file="${lang_path}/messages.po"
  mo_file="${lang_path}/messages.mo"
  msgfmt ${po_file} --output-file=${mo_file}
done
echo "Done."
