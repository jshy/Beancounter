#!perl -T

use Test::More tests => 2;
use lib '../lib';
BEGIN {
    use_ok( 'Beancounter::Journal::Transaction' ) || print "Bail out!
";
    use_ok( 'Beancounter::Ledger' ) || print "Bail out!
";
}

diag( "Testing Beancounter $Beancounter::VERSION, Perl $], $^X" );
