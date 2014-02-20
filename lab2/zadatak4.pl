#!/usr/bin/perl -w

while (<>) {
	chomp;
	if ( m/([\w]+);([\w]+);([\w]+);([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}):([0-9]{2}) ([0-9]{2}):([0-9]{2}).*;([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2}).*/) {
		$time1 = $5 * 60 + $6;
		$time2 = $10 * 60 + $11;

		if ($4 ne $9 or $time2 - $time1 > 60 ) {
			print $1." ".$2." ".$3." PROBLEM: ".$4." ".$7.":".$8." --> ".$9." ".$10.":".$11.":".$12."\n";
		}
	}
}
