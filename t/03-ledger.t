
use strict;
use warnings;

use Test::More;
use lib '../lib';
use Modern::Perl;


use Beancounter::Journal::Entry;
use Beancounter::Journal::Transaction;
use Beancounter::Ledger::Account::CreditAccount;
use Beancounter::Ledger::Account::DebitAccount;

BEGIN{ use_ok('Beancounter::Ledger'); }
my $t1 = Beancounter::Journal::Transaction->new(description => 'My transaction');

$t1->enforce_balance(1);

my $e1 = Beancounter::Journal::Entry->new(account_name => 'cash', account_code => '101', effect => 'debit', amount => 80);
my $e2 = Beancounter::Journal::Entry->new(account_name => 'equity', account_code => '201', effect => 'credit', amount => 50.50);

my $e3 = Beancounter::Journal::Entry->new(account_name => 'account102', account_code => '102', effect => 'debit', amount => 20);
my $e4 = Beancounter::Journal::Entry->new(account_name => 'account301', account_code => '301', effect => 'credit', amount => 49.50);

$t1->add_debit($e1);
$t1->add_debit($e3);

$t1->add_credit($e2);
$t1->add_credit($e4);

$t1->record;

my @accounts;
foreach ($t1->show_debits) {
	push @accounts, Beancounter::Ledger::Account::DebitAccount->new(account_code => $_->account_code, account_name => $_->account_name,);
}

foreach ($t1->show_credits) {
	push @accounts, Beancounter::Ledger::Account::CreditAccount->new(account_code => $_->account_code, account_name => $_->account_name,);
} 



my $ledger = Beancounter::Ledger->new(@accounts);
#my $ledger = Beancounter::Ledger->new;

$ledger->post($t1);

done_testing();
