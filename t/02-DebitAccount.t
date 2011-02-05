#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
#use lib "../lib";
use local::lib;
use aliased 'Finance::Accounting::AccountType::Debit';
use_ok('Finance::Accounting::COA');

my $account = Finance::Accounting::COA->with_traits(qw/Finance::Accounting::AccountType::Debit/)->new( 'account_code' => '101'); 

isa_ok($account, 'Finance::Accounting::COA');

$account->debit(50);
is($account->balance, 50, 'Account balance is 50');
isnt($account->balance, 10, 'Account balance isnt 10');

$account->credit(40);
isnt($account->balance, 50, 'Account balance is no longer 50');
is($account->balance, 10, 'Account balance is now 10');


done_testing();
