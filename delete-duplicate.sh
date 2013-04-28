#!/bin/bash
#

if [ ! $1 ];then exit; fi

for file in $1/*.mp3; do
  echo "$file"
  #a=$(printf '%q' "`basename "$file" .mp3`")
  #echo $a
  a=`basename "$file"`
  b=${a%.*}
  c=`echo $b | sed 's/([0-9])//g' | xargs`

  if [[ $b  =~ (\([0-9]\))$ ]]
  then
    echo $b
    rm -v "$file"
    continue
  fi

  #find ./$1/ -name "$a \(*\).mp3" -delete
  if grep -Fxq "$b" list
  then
    echo 'exists'
    rm -v "$file"
  else
    echo $b
    echo 'not exists'
    echo $b >> list
    mv "$file" toitunes/
  fi
  echo ""
done

#for file in $1/*.mp3; do
#  #echo "$file"
#  a=$(printf '%q' "`basename "$file" .mp3`")
#  #echo $a
#  if grep -Fxq "$a" list
#  then
#    echo 'exists'
#    rm -v "$file"
#  else
#    echo $a
#    echo 'not exists'
#    echo $a >> list
#    mv "$file" toitunes/
#  fi
#done
