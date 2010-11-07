package Syntax::Feature::Junction;

use strict;
use warnings;

# ABSTRACT: Provide keywords for any, all, none, or one

require Syntax::Keyword::Junction;

sub install {
  my ($class, %args) = @_;

  my $target  = $args{into};
  my $options = $args{options} || {};

  Syntax::Keyword::Junction->import({ into => $target }, %$options );

  return 1;
}

1;

=head1 SYNOPSIS

  use syntax 'junction';

  if (any(@grant) eq 'su') {
    ...
  }

  if (all($foo, $bar) >= 10) {
    ...
  }

  if (qr/^\d+$/ == all(@answers)) {
    ...
  }

  if (all(@input) <= @limits) {
    ...
  }

  if (none(@pass) eq 'password') {
    ...
  }

  if (one(@answer) == 42) {
    ...
  }

or if you want to rename an export, use L<Sub::Exporter> options:

  use syntax 'junction' => {
    any => { -as => 'robot_any' }
  };

  if (robot_any(@grant) eq 'su') {
    ...
  }

The full documentation for this module is in L<Syntax::Keyword::Junction>.  This
is just a way to use the sugar that L<syntax> gives us.

=cut

