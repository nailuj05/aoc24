#!/usr/bin/perl
use strict;
use warnings;

open(my $in, '<', 'input') or die "Cannot open input: $!";

my @list1 = ();
my %map;

while (my $line = <$in>) {
    chomp($line);
    my @split = split(/   /, $line);

    push(@list1, $split[0]);
    $map{$split[1]}++;
}

close($in);

my $score = 0;

foreach my $elem (@list1) {
    my $val = $map{$elem};
    $score += $elem * (defined $val ? $val : 0);
}

print "Score: $score\n";
