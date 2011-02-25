#!/usr/bin/perl

use strict;
use warnings;

use Modern::Perl;
use Test::More;                      # last test to print
use lib '../lib';

use Moose::Util qw(apply_all_roles);
use aliased 'Finance::Bookkeeping::Journal::Entry'; 
use aliased 'Finance::Bookkeeping::Journal::Transaction';
use_ok('Finance::Bookkeeping::Ledger::AccountFactory');
use Finance::Bookkeeping::Ledger::Account::Asset;
use Finance::Bookkeeping::Ledger;
#use Finance::Accounting::Bookkeeping::Ledger::Account;
#use Exp::Class1;


my $debit = Entry->new(account_code => '101', account_name => 'cash', amount => 50, t_effect => 'debit');  # Add whether its a debit or credit to the Entry.
my $credit1 = Entry->new(account_code => '201', account_name => 'AP_Customer1', amount => 10, t_effect => 'credit');
my $credit2 = Entry->new(account_code => '202', account_name => 'Expense', amount => 40, t_effect => 'credit');
my $trans = Transaction->new(debits => [$debit]);

#$trans->add_debit($debit);
$trans->add_credit($credit1);
$trans->add_credit($credit2);

isa_ok($debit, 'Finance::Bookkeeping::Journal::Entry', 'Entry');
is($debit->amount, 50, 'Debit Amount 50');
is($credit1->amount, 10, 'Credit Amount 50');

$trans->record;
#say $trans->dump;
#$trans->description eq 'Balanced'

#my $ledger = Finance::Accounting::Bookkeeping::Ledger::Account->with_traits('Finance::Accounting::Bookkeeping::Role::Ledger::Account::Asset')->new;
my $af = Finance::Bookkeeping::Ledger::AccountFactory->new;
my $asset = $af->create('Asset')->new(account_name => 'cash');

#my $ledger = Finance::Bookkeeping::Ledger->new(account => {$asset->account_name => $asset});
my $ledger = Finance::Bookkeeping::Ledger->new($asset);

######### Works but I dont like it ######
#my $asset = Finance::Accounting::Bookkeeping::Ledger::Account->new(account_name => 'cash');
#$asset->load_plugin('Asset');
##########################################

$asset->credit($debit->amount);
#say $asset->dump;
is($asset->balance, 0, 'Beginning Balance 0');
#isa_ok($asset, 'Finance', 'What Class');
$ledger->post($trans);
#$ledger->get($asset->account_name)->debit($debit->amount);
say $ledger->dump;

#apply_all_roles($ledger, 'Finance::Accounting::Bookkeeping::Role::Ledger::Account::Asset');
#my $exp = Exp::Class1->new;
done_testing();
