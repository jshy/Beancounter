use MooseX::Declare;

role Beancounter::Role::Journal::Transaction {
	use MooseX::Types::Moose qw(ArrayRef);

	requires 'record';

	has 'debits' => (
		traits => ['Array'],
		isa => 'ArrayRef[Beancounter::Role::Entry]', 
		is => 'rw',
		required => 0,
		default =>  sub { [] },
		handles => {
			show_debits => 'elements',
			add_debit => 'push',
			map_debits => 'map',
			},
		);

	has 'credits' => (
		traits => ['Array'], 
		isa => 'ArrayRef[Beancounter::Role::Entry]',  
		is => 'rw',
		required => 0,
		default =>  sub { [] },
		handles => {
			show_credits => 'elements',
			add_credit => 'push',
			map_credits => 'map',
			},
		);
}


1;
