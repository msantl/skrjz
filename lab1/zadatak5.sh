#!/bin/bash

if [ $# -ne 2 ]
	then
	echo "Potrebno je navesti 2 argumenta"
	echo "./zadatak5.sh arg1 arg2"
	exit 1
	fi

DAT1=$1
DAT2=$2


if [ ! -f $DAT1 ]
	then
	echo "$DAT1 nije datoteka"
	exit 1
	fi

if [ ! -f $DAT2 ]
	then
	echo "$DAT2 nije datoteka"
	exit 1
	fi

#echo -e "JMBAG\tPrezime Ime (grupa)\tBroj_bodova_1\tBroj_bodova_2"

while read line
	do
		jmbag=$( echo "$line" | cut -f1 )
		bodovi2=$( echo "$line" | cut -f2 )
	

		prezime="--"
		ime="--"
		grupa="(--)"
		bodovi1="--"

		podaci=$( grep $jmbag $DAT1 )
		if [ $? -eq 0 ]
			then
				ime_prezime=$( echo "$podaci" | cut -f2 -d';' )
				prezime=$( echo "$ime_prezime" | cut -f1 -d',' | cut -f2 -d' ' )
				ime=$( echo "$ime_prezime" | cut -f2 -d',' | cut -f2 -d' ' )
				grupa="("$( echo "$podaci" | cut -f4 -d';' | cut -f2 -d' ' )")"
				bodovi1=$( echo "$podaci" | cut -f3 -d';'| cut -f2 -d' ' )
			fi

		printf "%10s\t%10s %10s %5s\t%5s\t%5s\n" $jmbag $prezime $ime $grupa $bodovi1 $bodovi2

	done < $DAT2
