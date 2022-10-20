#!/bin/bash

n() { echo "a b c d e f g h i j k l m n o p q r s t u v w x y z" | cut -d"$1" -f 1 | tr " " "\n" | wc -l ; }

la() { echo " a b c d e f g h i j k l m n o p q r s t u v w x y z " | cut -d" " -f $(( ($RANDOM%25)+1 )) ; }

if [[ "$1" == "" ]]; then exit ; fi

ent=$1
echo
echo "String original: $ent"
echo

p1="$(echo $ent | tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba")"

p2="$(echo $p1 | tr " " "?")"

p3="$(echo $p2 | tr "\n" "#" )"

p4="$(for a in $(seq $(echo -n "$p3" | wc -c)) ; do
carac="$(echo "$p3" | cut -b $a)"
il="$(echo $carac | grep "[a-z]")"
if [ "$il" != "" ]; then
n $carac
else echo $carac
fi ;done | tr "\n" " " )"

p5="$(for b in $p4 ; do
  in="$(echo $b | grep "[1-9]")"
  if [ "$in" != "" ]; then
  let count++
  echo $(($b*$count))
else echo $b
fi ;done | tr "\n" " " )"

p6="$(for c in $p5 ; do
  im="$(echo $c | grep "[1-99999999999]")"
  if [ "$im" != "" ]; then
  let conte++
  echo $(($c*$conte))
else echo $c
fi ;done | tr "\n" " " )"

p7="$(echo $p6 | cut -d" " -f 1-12)"

p10="$(echo $p6 | cut -d" " -f 13-99999999999)"

p8="$(for d in $p7 ; do
  ia="$(echo $d | grep "[1-99999999999]")"
  if [ "$ia" != "" ]; then
  let contar++
  echo $(($d*$contar))
else echo $d
fi ;done | tr "\n" " ")"

p9="$(echo "$p8 $p10")"

p11="$(for e in $p9 ; do
  io="$(echo $e | grep "[1-99999999999]")"
  if [ "$io" != "" ]; then
  let con++
  echo -n "$(($e*$con))$(la)"
else echo -n $e
fi ;done )"
echo "$p11"
             