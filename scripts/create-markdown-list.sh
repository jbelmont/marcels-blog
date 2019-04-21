#! /bin/bash

pbpaste | gsed 's/^/* /g;s/$/\n/g' | pbcopy
