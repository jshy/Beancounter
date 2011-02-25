use MooseX::Declare;

class Beancounter::Journal::Transaction with Beancounter::Role::Journal::Transaction {
	
	method record { return; }

}

1;

__END__

=head1 NAME

=cut


