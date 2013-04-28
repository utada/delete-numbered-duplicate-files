#!/bin/bash
#

if [ ! $1 ];then exit; fi

for file in $1/*[\)].mp3; do
  #echo "$file"
  a=$(printf '%q' "`basename "$file" .mp3`")
  #echo $a
  find ./$1/ -name "$a \(*\).mp3" -delete
  if grep -Fxq "$a" list
  then
    echo 'exists'
    rm -v "$file"
  else
    echo $a
    echo 'not exists'
    echo $a >> list
    mv "$file" toitunes/
  fi

done

for file in $1/*.mp3; do
  #echo "$file"
  a=$(printf '%q' "`basename "$file" .mp3`")
  #echo $a
  if grep -Fxq "$a" list
  then
    echo 'exists'
    rm -v "$file"
  else
    echo $a
    echo 'not exists'
    echo $a >> list
    mv "$file" toitunes/
  fi

done
