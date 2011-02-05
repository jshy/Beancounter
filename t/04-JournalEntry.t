#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
#use lib '../lib';
use local::lib;

use Data::Dumper;
use feature qw(say);

use_ok('Finance::Accounting::JournalEntry');

my $debit1 = { account => '101', amount => 30 };
my $debit2 = { account => '102', amount => 10 };
my $credit1 = {account => '201', amount => 20 };
my $credit2 = {account => '202', amount => 10 };
my $credit3 = {account => '401', amount => 10 };

my $entry = Finance::Accounting::JournalEntry->new(description => 'This is my desc', debits => [$debit1, $debit2], credits => [$credit1, $credit2, $credit3]);

isa_ok($entry, 'Finance::Accounting::JournalEntry');
isa_ok($entry, 'Finance::Accounting::Transaction');

$entry->record;

say Dumper($entry);

done_testing();
