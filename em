#!/bin/sh
# following http://bc.tech.coop/blog/070225.html

/Applications/Emacs.app/Contents/MacOS/bin//emacsclient -n "${1}"
if [ $? -ne 0 ]; then
  open -a /Applications/Emacs.app "${1}"
fi

# TODO Verificar se arquivo existe, se não, criá-lo 
# TODO tentar juntar com emacs-pipe
