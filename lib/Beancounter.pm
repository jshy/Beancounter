use MooseX::Declare;

class Beancounter {
	use Beancounter::Journal;
	use Beancounter::Ledger;

	has journal => (
		is => 'rw',
		does => 'Beancounter::API::Journal',
		lazy => 1,
		default => sub { Beancounter::Journal->new },
	);

	has ledger => (
		is => 'rw',
		does => 'Beancounter::API::Ledger',
		lazy => 1,
		default => sub { Beancounter::Ledger->new },
	);

}


=head1 NAME

Beancounter - Double entry bookkeeping framework

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Beancounter;

    my $bc = Beancounter->new();
    ...
		my $bc = Beancounter->new(journal => 'Some::Journal::Store', ledger => 'Some::Ledger::Store');

=head1 ATTRIBUTES

=head2 journal

Journal Class to instantiate. Defaults to Beancounter::Journal

=head2 ledger

Ledger Class to instantiate. Defaults to Beancounter::Ledger

=head1 AUTHOR

Jesse Shy, C<< <jesseshy at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-beancounter at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Beancounter>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Beancounter


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Beancounter>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Beancounter>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Beancounter>

=item * Search CPAN

L<http://search.cpan.org/dist/Beancounter/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Jesse Shy.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Beancounter
