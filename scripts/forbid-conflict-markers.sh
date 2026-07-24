#!/usr/bin/env bash
set -euo pipefail

pattern='^(<<<<<<< |>>>>>>> |=======$)'
if matches=$(git grep -nE "$pattern" HEAD -- \
  ':!*.lock' ':!*.patch' 2>/dev/null); then
  printf '%s\n' "$matches" >&2
  echo 'REFUSING publication: unresolved conflict markers found.' >&2
  exit 1
fi

exit 0
