#! /bin/bash

HEADER=$(pbpaste | awk 'BEGIN { FS="[][]" } { print $2 }' | sed 's/^/## /g')

printf "%s\n\nContent\n" "${HEADER}" | pbcopy