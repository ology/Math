package ScaleNumber;

# ABSTRACT: Scale a number from one range to another

use strict;
use warnings;

use Exporter 'import';

our @EXPORT_OK = ('to_range');

our $VERSION = '0.0100';

=head1 NAME

ScaleNumber - Scale a number from one range to another

=head1 SYNOPSIS

  use lib $ENV{HOME} . '/sandbox/Math';

  use ScaleNumber 'to_range';

  my $x = 500;

  my $y = to_range($x, 500, 1000); # 0

  $y = to_range($x, 0, 1000); # 0.5

  $y = to_range($x, 0, 500); # 1

  $y = to_range($x, 0, 1000, -1, 1); # 0

=head1 FUNCTION

=head2 to_range

  $y = to_range($x, $from_min, $from_max);
  $y = to_range($x, $from_min, $from_max, $to_min, $to_max);

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

=head1 SEE ALSO

L<https://stats.stackexchange.com/q/281164>

=cut
