package Syntax::Keyword::Junction::Base;

use strict;
use warnings;

use overload(
    '=='   => "num_eq",
    '!='   => "num_ne",
    '>='   => "num_ge",
    '>'    => "num_gt",
    '<='   => "num_le",
    '<'    => "num_lt",
    'eq'   => "str_eq",
    'ne'   => "str_ne",
    'ge'   => "str_ge",
    'gt'   => "str_gt",
    'le'   => "str_le",
    'lt'   => "str_lt",
    'bool' => "bool",
    '""'   => sub {shift},
);

sub new {
    my ( $class, @param ) = @_;
    return bless \@param, $class;
}

sub values {
    my $self = shift;
    return wantarray ? @$self : [ @$self ];
}

1;
