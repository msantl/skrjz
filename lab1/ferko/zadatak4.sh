#!/bin/bash

if [ $# -ne 2 ]
	then
		echo "nema dovoljno argumenata"
		echo "zadatak4.sh arg1 arg2"
		exit 1
	fi

if [ "$2" -lt "$1" ]
	then
		echo "drugi argument ne smije biti manji od prvog"
		exit 1
	fi

lo=$(($1 - 1))
hi=$2

ukupno=0
datoteka=0

for file in $( find . -mtime +$lo -mtime -$hi )
	do
		if [ -f $file ]
			then
				znakova=$(wc -c $file | cut -d' ' -f1)
				datoteka=$(($datoteka + 1))
				ukupno=$(($znakova + $ukupno))
				echo "$file ........ $znakova znakova"
			fi
	done

echo "--------------------------"
echo "Ukupno $ukupno znakova u $datoteka datoteka."

exit 0

