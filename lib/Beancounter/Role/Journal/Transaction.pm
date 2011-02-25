use MooseX::Declare;

role Beancounter::Role::Journal::Transaction {
	use MooseX::Types::Moose qw(ArrayRef);
	use List::Util qw(sum);

	requires 'record';

	has 'debits' => (
		traits => ['Array'],
		isa => 'ArrayRef[Beancounter::Role::Journal::Entry]', 
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
		isa => 'ArrayRef[Beancounter::Role::Journal::Entry]',  
		is => 'rw',
		required => 0,
		default =>  sub { [] },
		handles => {
			show_credits => 'elements',
			add_credit => 'push',
			map_credits => 'map',
			},
		);

		has enforce_balance => (
		is => 'rw',
		isa => 'Bool',
		lazy => 1,
		default => 1,
	);

	has ['description', 'source'] => (
		isa => 'Str',
	  is => 'rw',
	);

	around record {
		my @debits = $self->map_debits( sub { $_->amount } );
		my @credits = $self->map_credits( sub { $_->amount } );

		if ($self->enforce_balance) { die unless (sum(@debits) == sum(@credits)); }	
		$self->$orig(@_);  
  }
	
}


1;
