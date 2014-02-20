#!/usr/bin/perl -w

print "Znakovni niz: ";
chomp( $niz = <STDIN> );
print "Broj pojavljivanja: ";
chomp( $n = <STDIN>  );

foreach (1..$n){
	print $niz."\n";
	}
