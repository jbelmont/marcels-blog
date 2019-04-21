#! /bin/bash

printf "{{< highlight %s >}}\n\n{{< / highlight >}}" $1 | pbcopy
