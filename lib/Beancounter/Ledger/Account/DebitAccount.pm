use MooseX::Declare;

class Beancounter::Ledger::Account::DebitAccount with Beancounter::Role::Account::DebitAccount {}

1;

=head1 NAME

Beancounter::Ledger::Account::DebitAccount

=head1 SYNOPSIS

my $ca = Beancounter::Ledger::Account::DebitAccount->new(account_code => '101');

=head1 DESCRIPTION

Account that debits and credits an account balance correctly for an account with a normal debit balance. This is an empty class to implement the DebitAccount Role. See that module for further documentation.

When creating accounts, what your really want are "accounting" account types. In the USA that is GAAP; Asset, Liability, Equity, Expense and Revenue. But those are accounting and not bookkeeping types. This is a class and not a role so that credit accounts can be used directly if wanted. Beancounter also has GAAP accounting account types so they can be collapesed into KiokuDB or something similar.

=head1 AUTHOR

Jesse Shy, <jesse@holdtheplan.com>

=head1 COPYRIGHT

Copyright 2011 Jesse Shy.  All Rights Reserved.  This is
free software; you may redistribute it and/or modify it under the same
terms as Perl itself.


=cut




