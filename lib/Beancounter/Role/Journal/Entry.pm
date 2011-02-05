use MooseX::Declare;

role Beancounter::Role::Entry {
	use Moose::Util::TypeConstraints qw(enum);
	use Finance::Accounting::Types qw(NumNotNeg);
	
	enum 'T_Effect' => qw(debit credit);

	has ['account_name', 'account_code'] => (
		isa => 'Str',
		is	=> 'ro',
		required => 1,
		);

	has 'effect' => (
		isa => 'T_Effect',
		is => 'rw',
		required => 1,
		);

	has 'amount' => (
#		isa => 'NumNotNeg',
		isa => 'Num',
		is => 'rw',
		required => 1,
		default => 0,
		);
}

1;

__END__

=head1 NAME

=cut


