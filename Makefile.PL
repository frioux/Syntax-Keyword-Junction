use 5.000;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Perl6::Junction',
    VERSION_FROM => 'lib/Perl6/Junction.pm',
    PREREQ_PM    => {
                     Carp       => 0,
                     Test::More => 0,
    },
);

