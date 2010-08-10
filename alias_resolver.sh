#!/bin/sh
if [ $# -eq 0 ]; then
  echo ""
  echo "Usage: $0 alias"
  echo "  where alias is an alias file."
  echo "  Returns the file path to the original file referenced by a"
  echo "  Mac OS X GUI alias.  Use it to execute commands on the"
  echo "  referenced file.  For example, if aliasd is an alias of"
  echo "  a directory, entering"
  echo '   % cd `apath aliasd`'
  echo "  at the command line prompt would change the working directory"
  echo "  to the original directory."
  echo ""
fi
if [ -f "$1" -a ! -L "$1" ]; then
    # Redirect stderr to dev null to suppress OSA environment errors
    exec 6>&2 # Link file descriptor 6 with stderr so we can restore stderr later
    exec 2>/dev/null # stderr replaced by /dev/null
    path=$(osascript << EOF
tell application "Finder"
set theItem to (POSIX file "${1}") as alias
if the kind of theItem is "alias" then
get the posix path of ((original item of theItem) as text)
end if
end tell
EOF
)
    exec 2>&6 6>&-      # Restore stderr and close file descriptor #6.

    echo "$path"
fi