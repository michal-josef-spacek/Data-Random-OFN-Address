use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Data::Random::OFN::Address');
}

# Test.
require_ok('Data::Random::OFN::Address');
