#!/usr/bin/perl -w

while (<>) {
	chomp;
	push( @lista, $_ );

}

$suma = 0;

foreach my $x (@lista) {
	$suma += $x;
}

if (@lista eq 0) {
	print "Division by zero.";
} else {
	print "Aritmetička sredina: ".$suma / @lista;	
}

print "\n";
