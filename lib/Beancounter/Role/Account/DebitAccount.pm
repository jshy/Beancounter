use MooseX::Declare;

role Beancounter::Role::Account::DebitAccount with Beancounter::Role::Account {

	method debit (Num $amount) {
		$self->balance($self->balance + $amount);
	}

	method credit (Num $amount) {
		$self->balance($self->balance - $amount);
	}

}
1;

__END__

=head1 NAME

=cut


