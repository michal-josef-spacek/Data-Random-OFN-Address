use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Random::OFN::Address', 'Data::Random::OFN::Address is covered.');
