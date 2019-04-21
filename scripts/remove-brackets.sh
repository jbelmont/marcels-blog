#! /bin/bash

pbpaste | sed -E 's/\[[[:digit:]]+\]//g' | pbcopy
