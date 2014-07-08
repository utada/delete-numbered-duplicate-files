#!/bin/bash
#

if [ ! $1 ];then exit; fi

for file in $1/*.mp3; do
  #echo "$file"
  #a=$(printf '%q' "`basename "$file" .mp3`")
  a=`basename "$file"`
  b=${a%.*}
  #echo $b
  #echo $a
  #c=`echo $b | sed 's/([0-9])//g' | xargs`

  #if [[ $b  =~ (\([0-99]\))$ ]]
  #then
  #  rm -v "$file"
  #  continue
  #fi

  #find ./$1/ -name "$a \(*\).mp3"
  find ./$1/ -name "$a \(*\).mp3" -delete

  b=`echo $b | sed 's/^ *//g'`
  grep -Fe "$b" list

  if grep -Fe "$b" list
  then
    echo 'exists'
    rm -v "$file"
  else
    echo $b
    echo 'not exists'
   echo $b | sed 's/^ *-* *//g' >> list
    mv "$file" toitunes/
  fi
  echo ""
done

cat list | sort | uniq > list2
mv list2 list

