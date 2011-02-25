
use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';
use Modern::Perl;

BEGIN{ use_ok('Beancounter::Journal::Entry'); }

my $e1 = Beancounter::Journal::Entry->new(account_name => 'cash', account_code => '101', effect => 'debit',);

isa_ok($e1, 'Beancounter::Journal::Entry', 'is Entry');
is($e1->amount, 0, 'Default amount is 0');

$e1->amount(100);
is($e1->amount, 100, 'Amount now 100');

done_testing();
