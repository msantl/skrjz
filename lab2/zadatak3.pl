#!/usr/bin/perl -w

if (@ARGV == 0) {
	push( @ARGV, "-" );
}

foreach my $file (@ARGV) {
	if ($file =~ m/.*([0-9]{4})-([0-9]{2})-([0-9]{2}).*/){
		print "Date: ".$3."/".$2."/".$1."\n";
	} else {
		print "Standardni ulaz\n";	
	}

	print "vrijeme : broj_pristupa\n";
	print "-----------------------\n";

	open LOG, "<$file";

	my %hash = ();

	while (<LOG>) {
		chomp;
		if (m/.*\:([0-9]{2})\:([0-9]{2})\:([0-9]{2}).*/) {
			if (exists $hash{$1}) {
				$hash{$1} += 1;
			} else {
				$hash{$1} = 0;
			}
		}
	}

	foreach my $key (sort keys %hash) {
		print "$key : $hash{$key} \n"	;
	}
	print "\n";
	close LOG;
}

