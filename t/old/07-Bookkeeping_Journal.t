#!/usr/bin/perl

use strict;
use warnings;

use Test::More;                      # last test to print
use lib '../lib';

use_ok('Finance::Accounting::Bookkeeping::Journal::Transaction');

done_testing();
