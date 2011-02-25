use MooseX::Declare;

class Beancounter::Journal::Entry with Beancounter::Role::Journal::Entry {}

1;

__END__

=head1 NAME

Beancounter::Journal::Entry

=head1 SYNOPSIS

my $entry = Beancounter::Journal::Entry->new(account_name => 'cash', account_code => '101', effect => 'debit',);

=head1 DESCRIPTION

This class implements the Beancounter::Role::Journal::Entry role. See that module for complete documentation

=head1 SEE ALSO

L<Beancounter::Role::Journal::Entry>

=head1 AUTHOR

Jesse Shy, <jesse@holdtheplan.com>

=head1 COPYRIGHT

Copyright 2011 Jesse Shy.  All Rights Reserved.  This is
free software; you may redistribute it and/or modify it under the same
terms as Perl itself.

=cut


