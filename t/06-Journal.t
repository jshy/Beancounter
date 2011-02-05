#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
#use local::lib;

use Data::Dumper;
use feature qw(say);

use_ok('Finance::Accounting::JournalEntry');


#my $entry = Finance::Accounting::JournalEntry->new(description => 'This is my desc', debits => [$debit1, $debit2], credits => [$credit1, $credit2, $credit3]);
my $entry = Finance::Accounting::JournalEntry->new();
isa_ok($entry, 'Finance::Accounting::JournalEntry');


my $debit1 = { account_code => '101', amount => 30 };
my $debit2 = { account_code => '102', amount => 10 };
my $credit1 = {account_code => '201', amount => 20 };
my $credit2 = {account_code => '202', amount => 10 };
my $credit3 = {account_code => '401', amount => 10 };

$entry->add_debit($_) for $debit1, $debit2;
$entry->add_credit($_) for $credit1, $credit2;
#my @debits = $entry->map_debits( sub { $_->{amount} } );
#isa_ok($entry, 'Finance::Accounting::Transaction');

$entry->record;

diag Dumper($entry) . "\n";
#diag @debits;
done_testing();
