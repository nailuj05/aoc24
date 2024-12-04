#!/usr/bin/perl
use strict;
use warnings;

my $sum = 0;
my $file;

open(my $fh, '<', 'input') or die "Cannot open file: $!";
while (my $line = <$fh>) {
		$file .= $line;
}

close($fh);

$file =~ s/don't\(\)(.*?)do\(\)//sg;

while ($file =~ /mul\((\d+),(\d+)\)/g) {
		$sum += $1 * $2;
} 

print "Sum: $sum";
