#!/usr/bin/perl 

use strict;
use warnings;

sub post_to_accounts (Account $account1, Account $account2) {
	scream("Debits and Credits dont equal!!!!") unless (sum(@debits) == sum(@credits));
	
	txn_do {
		$account1->post;
		$account2->post;
	}
	
}


my $account1 = F::A::COA->new(101);
my $account2 = F::A::COA->new(201);

my $entry = F::A::Entry->new(description => $some_text_decribing_transaction);

$entry->debit([ {account => $acct, amount => $amount } ]); 	## here, amount can be 0 as long as total is never less than 0
$entry->credit([ {account => $acct, amount => $amount } ]); ##  		same

$entry->post; #this checks to see if the amounts balance. If so, writes account_identifier, description, [debit|credit], amount to Journal
							# gets the transaction id and post the debits and credits to the accounts listed adjusting their balance


my $entry = F::A::JournalEntry->new(
	debits => [ {  $acct_id => $amount } ],
	credits => [ { $acct_id => $amount } ],
	);


$account1->debit($amount) and push @debits, $amount;
$account2->credit($amount) and push @credit, $amount;



