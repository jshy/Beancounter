#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
use Data::Dumper;
use feature qw(say);

use Finance::Accounting::Types qw(Entry);
use_ok('Finance::Accounting::Transaction');

my $debit = { account => '101', amount => '10' };
my $credit = { account => '201', amount => '20' };

my $entry = Finance::Accounting::Transaction->new(debits => [$debit], credits => [$credit]);

isa_ok($entry, 'Finance::Accounting::Transaction');
is($entry->debits->[0]->{amount}, 10, 'Debit for first entry is 10');

done_testing();
