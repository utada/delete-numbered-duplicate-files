#!/bin/bash
#

if [ ! $1 ];then exit; fi

for file in $1/*.mp3; do
  #echo "$file"
  #a=$(printf '%q' "`basename "$file" .mp3`")
  #echo $a
  a=`basename "$file"`
  b=${a%.*}
  #c=`echo $b | sed 's/([0-9])//g' | xargs`

  if [[ $b  =~ (\([0-9]\))$ ]]
  then
    #echo $b
    rm -v "$file"
    continue
  fi

  find ./$1/ -name "$a \(*\).mp3" -delete

  b=`echo $b | sed 's/^ *//g'`
  grep -Fe "$b" list

  if grep -Fe "$b" list
  then
    echo 'exists'
    rm -v "$file"
  else
  #  echo $a
    echo $b
    echo 'not exists'
   echo $b | sed 's/^ *-* *//g' >> list
  #  #echo $b >> list
    mv "$file" toitunes/
  fi
  echo ""
done

cat list | sort | uniq > list2
mv list2 list

