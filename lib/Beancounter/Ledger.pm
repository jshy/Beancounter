use MooseX::Declare;

class Beancounter::Ledger {
	use Modern::Perl;
	use Beancounter::Journal::Transaction;

	has 'account' => (
		traits => ['Hash'],
		is => 'rw',
		isa => 'HashRef',
		required => 1,
		default => sub { {} },
		handles => { 
				get_account 		=> 'get',
				add_account 		=> 'set',
				delete_account 	=> 'delete',
				list_accounts 	=> 'keys',
				is_account 			=> 'exists',
				},
		);

	method post (Beancounter::Journal::Transaction $trans) {
		$self->get_account($_->account_code)->debit($_->amount) foreach $trans->show_debits;
		$self->get_account($_->account_code)->credit($_->amount) foreach $trans->show_credits;
	}

	around BUILDARGS (ClassName $class: @args) {

		my %accounts = map { $_->account_code => $_ } @args;

		return $class->$orig(account => \%accounts);
		
	}

}

1;

__END__

=head1 NAME

Beancounter::Ledger

=head1 SYNOPSIS

my $ledger = Beancounter::Ledger->new(@accounts);
$ledger->post($trans);

=head1 DESCRIPTION

A collection of accounts that implement the debit and credit methods and methods to update the account balance based on transaction data.

=head1 METHODS

=head2 post

The post method takes a transaction object and updates the account balances with the debits and credit from that transaction.

=head1 ATTRIBUTES

=head2 account

The account attribute is a collection of account objects to be acted on. At this time there is no reason to call account directly as it is populated when you pass the array of hashrefs at build time and it has the Hash trait. Currently the following hash methods are delegated.

=head2 get_account     

Return the account object by hash key (account_code).

=head2 add_account

Add an account object to the hash.

=head2 delete_account

Remove the account object from the hash.

=head2 list_accounts

Returns the keys (account code) for the account objects in the hash.

=head2 is_account

Checks for the existence of the account in the hash.

=head1 SEE ALSO

L<Beancounter::Journal::Entry>

=head1 AUTHOR

Jesse Shy, <jesse@holdtheplan.com>

=head1 COPYRIGHT

Copyright 2011 Jesse Shy.  All Rights Reserved.  This is
free software; you may redistribute it and/or modify it under the same
terms as Perl itself.

==cut
