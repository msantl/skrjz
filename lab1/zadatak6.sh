#!/bin/bash

if [ $# -ne 2 ]
	then
	echo "Potrebno je navesti 2 argumenta" >&2
	echo "./zadatak6.sh arg1 arg2" >&2
	exit
	fi

DIR1=$1
DIR2=$2

if [ ! -d $DIR1 ]
	then
	echo "$DIR1 nije kazalo" >&2
	exit
	fi

if [ ! -d $DIR2 ]
	then
	echo "$DIR2 nije kazalo" >&2
	exit
	fi


svi=$( (ls $DIR1 && ls $DIR2) | sort | uniq )

for f in $svi
	do

		if [ -f $DIR1/$f ]
			then
				if [ ! -r $DIR1/$f ]
					then
						echo "Ne mogu procitati $DIR1/$f" >&2
						continue
					fi
			fi
		
		if [ -f $DIR2/$f ]
			then
				if [ ! -r $DIR2/$f ]
					then
						echo "Ne mogu procitati $DIR2/$f" >&2
						continue
					fi
			fi
		
		if [ ! -f $DIR1/$f ]
			then
				cp -p $DIR2/$f $DIR1/$f
				echo "$DIR2/$f -> $DIR1"
			elif [ ! -f $DIR2/$f ]
			then
				cp -p $DIR1/$f $DIR2/$f
				echo "$DIR1/$f -> $DIR2"
			else
				time1=$( stat -c "%Y" $DIR1/$f )
				time2=$( stat -c "%Y" $DIR2/$f )

				if [ $time1 -lt $time2 ]
					then
						if [ -w $DIR1/$f ]
							then
								rm $DIR1/$f
								cp -p $DIR2/$f $DIR1/$f
								echo "$DIR2/$f -> $DIR1"
							else
								echo "Ne mogu obrisati staru verziju $DIR1/$f" >&2
							fi
					fi
				if [ $time2 -lt $time1 ]
					then
						if [ -w $DIR2/$f ]
							then
								rm $DIR2/$f
								cp -p $DIR1/$f $DIR2/$f
								echo "$DIR1/$f -> $DIR2"
							else
								echo "Ne mogu obrisati staru verziju $DIR2/$f" >&2
							fi
					fi

			fi
	done

