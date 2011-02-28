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

__END__

=head1 NAME

Beancounter::Role::Journal::Transaction

=head1 SYNOPSIS

my $trans = Beancounter::Journal::Transaction->new(description => 'My entry', source => 'Invoice 10001');
...later...

my $e1 = Beancounter::Journal::Entry->new(account_name => 'cash', account_code => '101', effect => 'debit', amount => 80);
my $e2 = Beancounter::Journal::Entry->new(account_name => 'equity', account_code => '201', effect => 'credit', amount => 50.50);

$trans->add_debit($e1);
$trans->add_credit($e2);

$trans->record;

=head1 DESCRIPTION

This module implements the basics for double entry bookkeeping transactions and is implemented by the Beancounter::Journal::Transaction class. 
A transaction should have a description, a source and at least one debit entry and one credit entry, and they should balance; although you can disable this.

=head1 METHODS

=head2 record

You are required to have this method in you implementation class. 
Here this method is around yours and checks that the transactions balance; if set.

=head1 ATTRIBUTES

=head2 debits

An arrayref of objects that implement the Beancounter::Role::Journal::Entry role. 
Use this attribute to pass in debit entries at transaction creation. Or use add_debit to push them on after object instantiation.

=head2 credits

An arrayref of objects that implement the Beancounter::Role::Journal::Entry role. 
Use this attribute to pass in credit entries at transaction creation. Or use add_credit to push them on after object instantiation.

=head2 add_debit add_credit

Push another entry onto the array of debits or credits

=head2 show_debits show_credits

Returns the elements of the array as an array.
	
=head2 description

Read/Write string not required (but a smart idea to use) that describes this transaction. 'Sale of 15 widgets to cat lady.'

=head2 sources

Read/Write string for source document of this transaction.

Examples:
Text string such as 'Invoice #10001'
File path for scanned or created document such as check image
Database entry id
Database query string

=head2 enforce_balance

Boolean flag for whether the transaction debits and credits must balance at time of recording. 
If set to zero (0) your transaction will be allowed to be recorded even if unbalanced (which may be what your want depending on your control process).

=head1 SEE ALSO

L<Beancounter::Journal::Entry>

=head1 AUTHOR

Jesse Shy, <jesse@holdtheplan.com>

=head1 COPYRIGHT

Copyright 2011 Jesse Shy.  All Rights Reserved.  This is
free software; you may redistribute it and/or modify it under the same
terms as Perl itself.


=cut
