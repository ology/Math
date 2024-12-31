#!/usr/bin/env perl

# TBD

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Math::BigFloat ();
use Math::Prime::XS qw(primes);

my $limit = shift || 100;

my $last;
my $gap = 0;
my $n = 0;
for my $p (primes($limit)) {
    $n++;
    if (defined $last) {
        $gap = $p - $last;
    }
    $last = $p;
    my $x = Math::BigFloat->new($p);
    my $y = Math::BigFloat->new($gap);
    my $root = $x->broot($y);
    printf "%d. 1/%d: %.4f, gap: %d, root: %.4f\n", $n, $p, 1 / $p, $gap, $root;
}
