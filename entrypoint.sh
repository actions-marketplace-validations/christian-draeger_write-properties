#!/bin/bash -l

# active bash options:
#   - bash act as if it had been invoked as a login shell".
#     Login shells read certain initialization files from your home directory,
#     such as .bash_profile. (-l)
#   - stops the execution of the shell script whenever there are any errors from a command or pipeline (-e)
#   - option to treat unset variables as an error and exit immediately (-u)
#   - print each command before executing it (-x)
#   - sets the exit code of a pipeline to that of the rightmost command
#     to exit with a non-zero status, or to zero if all commands of the
#     pipeline exit successfully (-o pipefail)
set -euo pipefail

main() {

  local path="$1";
  local keysString="$2";
  local valuesString="$3";

  IFS=$'\n\r' read -r -a keys <<<"$keysString"
  IFS=$'\n\r' read -r -a values <<<"$valuesString"
  unset IFS

  local index=0;
  for i in "${keys[@]}"; do
    echo "$i=${values[index]}"
    echo "$i=${values[index]}" >> $path
    index=$index+1
  done
}

main "$1" "$2" "$3"
