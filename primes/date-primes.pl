#!/usr/bin/env perl

# Find dates that are prime

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use List::Util qw(sum0);
use Math::Prime::XS qw(is_prime);
use Statistics::Basic qw(mean median stddev);
use Time::Moment ();

my $start_year = shift || 2025;
my $end_year   = shift || 2030;

my $year  = $start_year;
my $month = 1;
my $day   = 1;

my $tm = Time::Moment->new(
    year  => $year,
    month => $month,
    day   => $day,
);

my $prime_stamps = {};
my $by_year      = {};
my $by_month     = {};
my $months       = {};
my $days         = {};

while ($year <= $end_year) {
    $month = sprintf '%02d', $tm->month;
    $day   = sprintf '%02d', $tm->day_of_month;
    my $stamp = $year . $month . $day;
    if (is_prime($stamp)) {
        push $prime_stamps->{$year}{$month}->@*, $stamp;
        $by_year->{$year}++;
        $by_month->{$year}{$month}++;
        $days->{$day}++;
    }
    $tm = $tm->plus_days(1);
    $year = $tm->year;
}

for my $y (sort keys %$by_month) {
    for my $month (sort keys $by_month->{$y}->%*) {
        push $months->{$month}->@*, $by_month->{$y}{$month};
    }
}

print "\nPrime dates: ", ddc $prime_stamps;
print "\nPrimes per day: ", ddc $days;
print "\nPrimes per year by month: ", ddc $months;
for my $m (sort keys $months->%*) {
    printf "$m: Mean: %.3f, Stddev: %.3f, Median: %.3f, Total: %d\n",
        mean($months->{$m}), stddev($months->{$m}), median($months->{$m}), sum0($months->{$m}->@*);
}
print "\nPrimes per year: ", ddc $by_year;

