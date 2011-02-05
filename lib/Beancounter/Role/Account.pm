use MooseX::Declare;

role Beancounter::Role::Account {
	requires 'debit';
	requires 'credit';


	has 'account_name' => (
		isa => 'Str',
		is => 'rw',
	);

	has 'balance' => (
		traits => ['Number'],
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


