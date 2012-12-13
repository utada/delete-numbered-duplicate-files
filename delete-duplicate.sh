#!/bin/bash

for file in *[^\)].mp3; do
  #echo "$file"
  a=$(printf '%q' "`basename "$file" .mp3`")
  find . -name "$a \(*\).mp3" -exec rm -v {} \;
done
