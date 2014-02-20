#!/usr/bin/perl -w

if (@ARGV < 1) {
	die "Nema dovoljno argumenata!";
}

if (! open ULAZ, "<$ARGV[0]") {
	die "Ne mogu otvoriti datoteku!";
}

chomp( $line = <ULAZ> );

@koef = split/;/, $line;

%imenik = ();

while ( <ULAZ>) {
	chomp;

	@data = split/;/, $_;

	$student = $data[1].", ".$data[2]." (".$data[0].")";
	$bodovi = 0;
	foreach my $i (0..$#koef) {
		$bod = $data[ $i + 3 ];

		if ($data[$i + 3] eq "-") {
			$bod = 0;
		}

		$bodovi += $koef[$i] * $bod;
	}

	$imenik{ $student } = $bodovi;

}

$counter = 1;

print "Lista po rangu:\n";
print "-------------------\n";

foreach my $x (reverse sort {$imenik{$a} <=> $imenik{$b}} keys %imenik) {
	printf "%d.%-50s : %s\n", $counter, $x, $imenik{$x};
	$counter += 1;
}

close ULAZ;
