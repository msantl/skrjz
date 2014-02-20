#!/bin/bash

grep -iE 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

grep -iEv 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt > ne-voce.txt

grep -E '\b[[:upper:]]{3}[[:digit:]]{6}\b' ~/projekti/ -R | cut -f2 -d':'

find . -mtime -14 -mtime +6 -ls

for i in $(seq 1 15)
	do
		echo "$i"
	done

brojac=1
for f in $(ls .)
	do
		if [ -f $f ]
			then
			broj_redaka=$(wc -l $f | cut -f1 -d' ')
			echo "$brojac. $f ... $broj_redaka redaka"
			echo "--------------------------"
			head -n 3 $f
			echo "--------------------------"
			brojac=$(($brojac + 1))
			fi
	done
