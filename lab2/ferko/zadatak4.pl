#!/usr/bin/perl -w

if (@ARGV != 1) {
  die( "Neispravno koristenje: ./zadatak4.pl <datoteka>\n" );
}

$file = $ARGV[0];

if (! open FILE, "<", $file) {
  die( "Ne mogu otvoriti datoteku $file\n" );
}

$ispisao = 0;

while (<FILE>) {
  chomp;

  if ( m/(.*), (.*);(.*);([0-9]{4})/ ) {
    if (! $ispisao) {
      $ispisao = 1;
      print "<UL>\n";
    }

    print "\t<LI> ";
    print "$2 $1, ";
    print "<I>$3</I>, ";
    print "$4";
    print " </LI>\n";
  }
}

if ($ispisao) {
  print "</UL>\n";
}

close FILE;

