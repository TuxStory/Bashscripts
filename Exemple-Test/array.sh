#!/bin/bash

names=('riri' 'fifi' 'loulou')
echo ${names[@]}
names+=('Picsou')
echo ${names[@]}
echo ${#names[@]}
echo ${names[0]}
echo ${names[1]}

echo "===== loop ====="
for str in ${names[@]}; do
  echo $str
done

echo "===== loop 2 ====="
for i in ${!names[@]}; do
  echo "element $i is ${names[$i]}"
done

echo "===== Removes ====="
names+=('Donald')
unset names[3]
echo ${names[@]}

echo ===== Upper Case =====
echo ${names[1]^}
echo ${names[1]^^}
