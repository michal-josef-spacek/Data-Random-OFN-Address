use strict;
use warnings;

use Data::Random::OFN::Address;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Random::OFN::Address::VERSION, 0.01, 'Version.');
