use MooseX::Declare;

role Beancounter::Role::Journal::Entry {
	use Moose::Util::TypeConstraints;
	use MooseX::Types::Moose qw(Str Num HashRef ArrayRef);

	subtype 'NumNotNeg' 
	  => as 'Num' 
	  => where { $_ >= 0 }
	  => message { "Can not be a negative number" };

	
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
		isa => 'NumNotNeg',
		is => 'rw',
		required => 1,
		lazy => 1,
		default => 0,
		);
}

1;

__END__

=head1 NAME

Beancounter::Role::Journal::Entry

=head1 SYNOPSIS

my $entry = Beancounter::Journal::Entry->new(account_name => 'cash', account_code => '101', effect => 'debit',);

=head1 DESCRIPTION

This role provides methods and attributes the the Beancounter::Journal::Entry class.
	
A proper bookkeeping(accounting) transaction has at least one debit entry and one credit entry. 
This module implements the necessary minimum attributes for an "entry". 

(Really you only needed account code or account name not both its on the todo list to have a BUILDARGS so if you pass one, it make the other the same.)

=head1 ATTRIBUTES

=head2 account_name and account_code

Readonly required string. Normally account code would be some numerical code, often defined by GAAP rules. 
This can be whatever code mapping identification your bookkeeping policy specifies. 
Account name is normally some description of what the account is, like CASH or First National Bank #1111111. 
The same applies as for account code, use whatever your policy specifies.

=head2 amount

This is a number zero or greater. This attrib uses the custome subtype NumNotNeg to ensure that only non-negative numbers are used. 
Account balances will be adjusted according to the debit/credit rules for that account type. 
If it is a Debit Account and you debit it, it will increase the balance, if you credit it, it will decrease the balance. 
Negative numbers can not be used for subtraction.

=head2 effect

This is either debit or credit and is restricted by the customer enum typeconstraint T_Effect.

=head1 SEE ALSO

L<Beancounter::Journal::Entry>

=head1 AUTHOR

Jesse Shy, <jesse@holdtheplan.com>

=head1 COPYRIGHT

Copyright 2011 Jesse Shy.  All Rights Reserved.  This is
free software; you may redistribute it and/or modify it under the same
terms as Perl itself.


=cut
