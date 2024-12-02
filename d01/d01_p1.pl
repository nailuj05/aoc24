#!/usr/bin/perl
use strict;
use warnings;

open(my $in, '<', 'input') or die "Cannot open input: $!";

my @list1 = ();
my @list2 = ();

while (my $line = <$in>) {
    # consume \n and split (3x space)
    chomp($line);
    my @split = split(/   /, $line);

    push(@list1, $split[0]);
    push(@list2, $split[1]);
}

close($in);

my @sorted1 = sort @list1;
my @sorted2 = sort @list2;

my $distance = 0;

foreach my $i (0 .. $#sorted1) {
    $distance += abs($sorted1[$i] - $sorted2[$i])
}

print "Distance: $distance\n";
