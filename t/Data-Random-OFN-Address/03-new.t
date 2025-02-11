use strict;
use warnings;

use Data::Random::OFN::Address;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::Random::OFN::Address->new;
isa_ok($obj, 'Data::Random::OFN::Address');

# Test.
eval {
	Data::Random::OFN::Address->new(
		'mode_address_place' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'mode_address_place' must be a bool (0/1).\n",
	"Parameter 'mode_address_place' must be a bool (0/1) (bad).");
clean();

# Test.
eval {
	Data::Random::OFN::Address->new(
		'mode_ofn_examples' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'mode_ofn_examples' must be a bool (0/1).\n",
	"Parameter 'mode_ofn_examples' must be a bool (0/1) (bad).");
clean();
