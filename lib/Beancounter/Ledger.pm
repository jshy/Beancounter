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

=cut


