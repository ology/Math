package ScaleNumber;

use strict;
use warnings;

=head1 NAME

ScaleNumber - Scale a number from one range to another

=head1 SYNOPSIS

  my $x = 500;

  my $y = ScaleNumber::scale($x, 0, 1000); # 0.5

  $y = ScaleNumber::scale($x, 500, 1000); # 0

  $y = ScaleNumber::scale($x, 0, 500); # 1

  $y = ScaleNumber::scale($x, 0, 900, 100, 1000); # 600

=head1 FUNCTION

=head2 scale

  $y = ScaleNumber::scale($n, $r_min, $r_max, $t_min, $t_max);

Scale a number from one range to another.

If not given a number and its data range, the function will die.

If not given a target range to scale to, 0 to 1 inclusive is used.

=cut

sub scale {
    # Number to scale, the range it is in, & the target range to scale to
    my ($n, $r_min, $r_max, $t_min, $t_max) = @_;

    die 'Number to scale not given'
        unless defined $n;
    die 'Data range not given'
        unless defined $r_min && defined $r_max;

    $t_min = 0 unless defined $t_min;
    $t_max = 1 unless defined $t_max;

    my $scaled = (($n - $r_min) / ($r_max - $r_min)) * ($t_max - $t_min) + $t_min;

#    print "$n in [$r_min,$r_max] -> $scaled in [$t_min,$t_max]\n";

    return $scaled;
}

1;
