#!/bin/bash

for f in $(ls)
	do
		datum=$(echo "$f" | grep -Eo '([0-9]{4})-02-([0-9]{2})' )
		if [ $? -eq 0 ]
			then
				d=$( echo "$datum" | cut -f3 -d'-' )
				m=$( echo "$datum" | cut -f2 -d'-' )
				y=$( echo "$datum" | cut -f1 -d'-' )
				echo "datum: $d-$m-$y"
				echo "------------------------"
				cat $f | cut -f2 -d\" | sort | uniq -c | sort -r -n -k 1
			fi
	done
