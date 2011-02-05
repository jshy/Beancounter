#!/usr/bin/perl


use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
use Data::Dumper;
use feature qw(say);

use Finance::Accounting::Types qw(Entry);

my $entry = Entry->new(Entry([{account => '101', amount => '10'}]));

say Dumper($entry->amount);

done_testing();
