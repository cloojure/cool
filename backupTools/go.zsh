#!/bin/zsh 

function dateTimeStr()  {
  echo $(date --iso-8601=seconds \ | sed -e'\''s/^\(.\{19\}\)\(.*\)/\1/'\'' | sed -e'\''s/-//g'\'' | sed -e'\''s/://g'\'' | sed -e'\''s/T/-/g'\' )
}

function homeStr() {
  echo  $(echo "${HOME}" | sed -e 's:\/:-:g' )
}

function backup-tar-name() {
  echo "$(dateTimeStr)-$(hostname)$(homeStr).tar"
}

function output-pathname() {
  echo "/media/alan/SeagateBackup/$(backup-tar-name)"
}

echo ""
echo "output-pathname   => $(output-pathname)"
echo ""

echo $0

tar --create --verbose  \
  --file "${output-pathname}"  \
  --exclude-from tar-excludes.txt  \
  ${HOME}

