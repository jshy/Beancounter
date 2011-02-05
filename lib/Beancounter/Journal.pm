use MooseX::Declare;

class Beancounter::Journal {
	use Beancounter::Journal::Transaction;

	has transaction => (
		is => 'rw',
		isa => 'Beancounter::Journal::Transaction',
	);


	
}
1;

__END__

=head1 NAME

=cut


