use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'PGObject::Util::PGConfig',
    AUTHOR           => q{Chris Travers <chris.travers@adjust.com>},
    VERSION_FROM     => 'lib/PGObject/Util/PGConfig.pm',
    ABSTRACT_FROM    => 'lib/PGObject/Util/PGConfig.pm',
    LICENSE          => 'bsd',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        'DBI' => 0,
        'DBD::Pg' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'PGObject-Util-PGConfig-*' },
);
