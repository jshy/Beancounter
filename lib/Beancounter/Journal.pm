use MooseX::Declare;

class Beancounter::Journal {
	use Beancounter::Journal::Transaction;

	has transaction => (
		is => 'rw',
		isa => 'Beancounter::Journal::Transaction',
	);

	has store => (
		is => 'rw',
		isa => 'Beancounter::Store',
	);
	
}
1;


=head1 NAME

	Beancounter::Journal

=head1 SYNOPSIS

	
