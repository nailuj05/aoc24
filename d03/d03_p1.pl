#!/usr/bin/perl
use strict;
use warnings;

my $sum = 0;

open(my $fh, '<', 'input') or die "Cannot open file: $!";
while (my $line = <$fh>) {
		while ($line =~ /mul\((\d+),(\d+)\)/g) {
				$sum += $1 * $2;
		}
}

close($fh);

print "Sum: $sum";
