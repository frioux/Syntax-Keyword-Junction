package Syntax::Keyword::Junction;
use strict;

use Syntax::Keyword::Junction::All;
use Syntax::Keyword::Junction::Any;
use Syntax::Keyword::Junction::None;
use Syntax::Keyword::Junction::One;

require Exporter;
our $VERSION = '1.40000';

our @ISA = qw/ Exporter /;
my @routines = qw/ all any none one /;
our @EXPORT_OK = @routines;
our %EXPORT_TAGS = ( ALL => [@routines] );

sub all {
    return Syntax::Keyword::Junction::All->new(@_);
}

sub any {
    return Syntax::Keyword::Junction::Any->new(@_);
}

sub none {
    return Syntax::Keyword::Junction::None->new(@_);
}

sub one {
    return Syntax::Keyword::Junction::One->new(@_);
}

1;

__END__

=head1 NAME

Syntax::Keyword::Junction - Perl6 style Junction operators in Perl5.

=head1 SYNOPSIS

  use Syntax::Keyword::Junction qw/ all any none one /;

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

=head1 DESCRIPTION

This is a lightweight module which provides 'Junction' operators, the most
commonly used being C<any> and C<all>.

Inspired by the Perl6 design docs,
L<http://dev.perl.org/perl6/doc/design/exe/E06.html>.

Provides a limited subset of the functionality of L<Quantum::Superpositions>,
see L</"SEE ALSO"> for comment.

Notice in the L</SYNOPSIS> above, that if you want to match against a
regular expression, you must use C<==> or C<!=>. B<Not> C<=~> or C<!~>. You
must also use a regex object, such as C<qr/\d/>, not a plain regex such as
C</\d/>.


=head1 SUBROUTINES

=head2 all()

Returns an object which overloads the following operators:

  '<',  '<=', '>',  '>=', '==', '!=',
  'lt', 'le', 'gt', 'ge', 'eq', 'ne',

Returns true only if B<all> arguments test true according to the operator
used.

=head2 any()

Returns an object which overloads the following operators:

  '<',  '<=', '>',  '>=', '==', '!=',
  'lt', 'le', 'gt', 'ge', 'eq', 'ne',

Returns true if B<any> argument tests true according to the operator used.

=head2 none()

Returns an object which overloads the following operators:

  '<',  '<=', '>',  '>=', '==', '!=',
  'lt', 'le', 'gt', 'ge', 'eq', 'ne',

Returns true only if B<no> argument tests true according to the operator
used.

=head2 one()

Returns an object which overloads the following operators:

  '<',  '<=', '>',  '>=', '==', '!=',
  'lt', 'le', 'gt', 'ge', 'eq', 'ne',

Returns true only if B<one and only one> argument tests true according to
the operator used.

=head1 ALTERING JUNCTIONS

You cannot alter junctions.  Instead, you can create new junctions out of old
junctions.  You can do this by calling the C<values> method on a junction.

 my $numbers = any(qw/1 2 3 4 5/);
 print $numbers == 3 ? 'Yes' : 'No';   # Yes

 $numbers = any( grep { $_ != 3 } $numbers->values );
 print $numbers == 3 ? 'Yes' : 'No';   # No

=head1 EXPORT

'all', 'any', 'none', 'one', as requested.

All subroutines can be called by its fully qualified name, if you don't
want to export them.

  use Syntax::Keyword::Junction;

  if (Syntax::Keyword::Junction::any( @questions )) {
    ...
  }

=head1 WARNING

When comparing against a regular expression, you must remember to use a
regular expression object: C<qr/\d/> B<Not> C</d/>. You must also use either
C<==> or C<!=>. This is because C<=~> and C<!~> cannot be overriden.

=head1 TO DO

Add overloading for arithmetic operators, such that this works:

  $result = any(2,3,4) * 2;

  if ($result == 8) {...}

=head1 SEE ALSO

This module is actually a fork of L<Perl6::Junction> with very few
(initial) changes.  The reason being that we want to avoid the
incendiary name containing Perl6.

L<Quantum::Superpositions> provides the same functionality as this, and
more. However, this module provides this limited functionality at a much
greater runtime speed, with my benchmarks showing between 500% and 6000%
improvment.

L<http://dev.perl.org/perl6/doc/design/exe/E06.html> - "The Wonderful World
of Junctions".

=cut

