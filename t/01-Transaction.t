##TODO: Add test for negative number failure
use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
use Modern::Perl;

use Beancounter::Journal::Entry;

BEGIN{ use_ok('Beancounter::Journal::Transaction'); }

my $t1 = Beancounter::Journal::Transaction->new(description => 'My entry');

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

diag say $t1->dump;


done_testing();

