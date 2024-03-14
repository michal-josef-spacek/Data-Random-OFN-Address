use strict;
use warnings;

use Data::Random::OFN::Address;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Random::OFN::Address->new;
isa_ok($obj, 'Data::Random::OFN::Address');
