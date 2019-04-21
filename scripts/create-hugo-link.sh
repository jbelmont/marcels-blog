#! /bin/bash

printf "{{< figure src=\"%s\" >}}" $(pbpaste | sed 's/static//g') | pbcopy
