#!/bin/bash

if [ $# -ne 2 ]
	then
	echo "Potrebno je navesti 2 argumenta"
	echo "./zadatak4.sh arg1 arg2"
	exit
	fi

ULAZ=$1
IZLAZ=$2

if [ ! -d $ULAZ ]
	then
	echo "Ne postoji kazalo $ULAZ"
	exit
	fi

mkdir -p $IZLAZ

for f in $(ls $ULAZ)
	do
		if [ -f $ULAZ/$f ]
			then
				kazalo=$( stat $ULAZ/$f -c "%Y" | date +"%Y-%m" )
				mkdir -p $IZLAZ/$kazalo
				mv $ULAZ/$f $IZLAZ/$kazalo
			fi
	done

