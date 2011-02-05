use MooseX::Declare;

class Beancounter::Ledger {
	use Modern::Perl;

	has 'account' => (
		traits => ['Hash'],
		is => 'rw',
		isa => 'HashRef',
		required => 1,
		default => sub { {} },
		handles => { get => 'get' },
		);

	method post (Beancounter::Journal::Transaction $trans) {
		$self->get($_->account_name)->debit($_->amount) foreach $trans->show_debits;
		#$self->get($_->account_name)->credit($_->amount) foreach $trans->show_credits;
	}

	around BUILDARGS (ClassName $class: @args) {
 		
		my %accounts = map { $_->account_name => $_ } @args;
		return $class->$orig( account => {$args[0]->account_name => $args[0]} );
		
	}

}

1;

__END__

=head1 NAME

=cut


