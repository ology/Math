#!usr/bin/env perl
use strict;
use warnings;

# Generate the Perrine primes up to a given limit.

use Data::Dumper::Compact qw(ddc);
use Math::Prime::Util qw(is_prime);
use Math::BigInt ();

my $limit = shift || 13;

my @perrine = qw(3 0 2);
my @primes;
my %seen;

my $perrine = sub {
  my ($list) = @_;
  return $list->[-2] + $list->[-3];
};

while (@primes < $limit){
  my $p = $perrine->(\@perrine);

  my $bigp = Math::BigInt->new($p);

  push @perrine, $bigp;

  if (is_prime($bigp)) {
    push @primes, $bigp->bstr
      unless $seen{$bigp}++;
  }
}

warn ddc(\@primes);
