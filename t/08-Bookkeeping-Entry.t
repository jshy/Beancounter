#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
use aliased 'Finance::Accounting::Bookkeeping::Journal::Entry'; 
use aliased 'Finance::Accounting::Bookkeeping::Journal::Transaction';

my $debit = Entry->new(account_code => '101', account_name => 'cash', amount => 60);
my $credit1 = Entry->new(account_code => '201', account_name => 'AP_Customer1', amount => 10);
my $credit2 = Entry->new(account_code => '202', account_name => 'Expense', amount => 40);
my $trans = Transaction->new(debits => [$debit]);

#$trans->add_debit($debit);
$trans->add_credit($credit1);
$trans->add_credit($credit2);

isa_ok($debit, 'Finance::Accounting::Bookkeeping::Journal::Entry', 'Entry');
is($debit->amount, 60, 'Debit Amount 50');
is($credit1->amount, 10, 'Credit Amount 50');

$trans->record;
diag $trans->description;

done_testing();
