package ScaleNumber;

use strict;
use warnings;

use Exporter 'import';

our $VERSION = '0.0100';

our @EXPORT_OK = ('to_range');

=head1 NAME

ScaleNumber - Scale a number from one range to another

=head1 SYNOPSIS

  my $x = 500;

  my $y = ScaleNumber::to_range($x, 0, 1000); # 0.5

  $y = ScaleNumber::to_range($x, 500, 1000); # 0

  $y = ScaleNumber::to_range($x, 0, 500); # 1

  $y = ScaleNumber::to_range($x, 0, 900, 100, 1000); # 600

=head1 FUNCTION

=head2 to_range

  $y = ScaleNumber::to_range($x, $from_min, $from_max);
  $y = ScaleNumber::to_range($x, $from_min, $from_max, $to_min, $to_max);

Scale a number from one range to another.

If not given a number and its data range, the function will die.

If not given a target range to scale to, 0 to 1 inclusive is used.

=cut

sub to_range {
    # Number to scale, the range it is in, & the target range to scale to
    my ($n, $f_min, $f_max, $t_min, $t_max) = @_;

    die 'Number to scale not given'
        unless defined $n;
    die 'Data range not given'
        unless defined $f_min && defined $f_max;

    $t_min //= 0;
    $t_max //= 1;

    my $scaled = (($n - $f_min) / ($f_max - $f_min)) * ($t_max - $t_min) + $t_min;

#    print "$n in [$f_min,$f_max] -> $scaled in [$t_min,$t_max]\n";

    return $scaled;
}

=head1 AUTHOR

Gene Boggs

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Gene Boggs.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut

1;
