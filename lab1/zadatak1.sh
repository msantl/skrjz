#!/bin/bash

proba="Ovo je proba"
echo "$proba"

lista=$(find . -maxdepth 1 -type f)
echo "$lista"

proba3=""
for ((i=0; i < 3; ++i))
	do
		proba3=$proba3$proba'. '
	done

echo "$proba3"

a=4
b=3
c=7
d=$((($a+4)*$b % $c))
echo "$d"

broj_rijeci=$(cat *.txt | wc -w)
echo "$broj_rijeci"

ls ~

cut -f1,6,7 -d':' /etc/passwd

ps -f | tr -s ' ' | tail -n +2  | cut -d' ' -f1,2,8
