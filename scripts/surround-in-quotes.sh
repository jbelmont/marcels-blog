#! /bin/bash

echo "[" 
pbpaste | sed 's/^[[:alnum:]]/\"&/g;s/$/&\",/g;$s/,//g'
echo "]"