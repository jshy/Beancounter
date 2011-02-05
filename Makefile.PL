use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Beancounter',
    AUTHOR              => q{Jesse Shy <jesseshy@gmail.com>},
    VERSION_FROM        => 'lib/Beancounter.pm',
    ABSTRACT_FROM       => 'lib/Beancounter.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Beancounter-*' },
);
