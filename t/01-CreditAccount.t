#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
use lib "../lib";

use_ok('Finance::Accounting::COA');

my $account = Finance::Accounting::COA->with_traits(qw/Finance::Accounting::AccountType::Credit/)->new( 'account_code' => '101');

isa_ok($account, 'Finance::Accounting::COA');

is($account->account_code, 101, 'Account Code 101');

$account->credit(50);
is($account->balance, 50, 'Account balance is 50');
isnt($account->balance, 10, 'Account balance isnt 10');

$account->debit(40);
isnt($account->balance, 50, 'Account balance is no longer 50');
is($account->balance, 10, 'Account balance is now 10');

done_testing();
