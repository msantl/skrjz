#!/usr/bin/perl -w

if (@ARGV < 1) {
	die "Nema dovoljno argumenata";
}

$pomak = ord($ARGV[0]) - ord( 'A' );

shift( @ARGV );

while (<>) {
	chomp;
	for ( my $i = 0; $i < length($_); $i++ ) {
		$znak = substr( $_, $i, 1 );
		if ("A" le $znak and $znak le "Z") {
			print chr( ord('A') + ( ord($znak) - ord('A') - $pomak) % 26 );
		} else {
			print $znak;
		}
	}
	print "\n";
}
