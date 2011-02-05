use MooseX::Declare;

class Beancounter::Jounal::Transaction with Beancounter::Role::Journal::Transaction {
	use TryCatch;
	use List::Utils qw(sum);


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

		if ($self->enforce_balance) { return 'nb' unless (sum(@debits) == sum(@credits)); }
  	
		$self->$orig(@_);  
  }
																									
}

1;

__END__

=head1 NAME

=cut


