#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
FILENAME="$DIR/$(basename ${BASH_SOURCE:-$0})"

for file in $DIR/*.sh; do
  if [[ "$file" != "$FILENAME" ]]; then
    source "$file"
  fi
done
