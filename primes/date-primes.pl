#!/usr/bin/env perl

# Find dates that are prime

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Math::Prime::XS qw(is_prime);
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

while ($year <= $end_year) {
    $month = sprintf '%02d', $tm->month;
    $day   = sprintf '%02d', $tm->day_of_month;
    my $stamp = $year . $month . $day;
    if (is_prime($stamp)) {
        push $prime_stamps->{$year}{$month}->@*, $stamp;
        $by_year->{$year}++;
        $by_month->{$year}{$month}++;
    }
    $tm = $tm->plus_days(1);
    $year = $tm->year;
}
print 'Prime dates: ', ddc $prime_stamps;
print 'By month count: ', ddc $by_month;
print 'By year count: ', ddc $by_year;
