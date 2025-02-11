package Data::Random::OFN::Address;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::OFN::Address;
use Data::Text::Simple;
use Readonly;
use Test::Shared::Fixture::Data::OFN::Address::Place;
use Test::Shared::Fixture::Data::OFN::Address::String;
use Test::Shared::Fixture::Data::OFN::Address::Struct;
use Unicode::UTF8 qw(decode_utf8);

Readonly::Array our @MUNICIPALITIES => (
	'Stolice',
	'Kraslice',
	'Petlice',
	decode_utf8('Ovčín'),
);
Readonly::Array our @STREETS => (
	decode_utf8('Růžová'),
	decode_utf8('Fialová'),
	decode_utf8('Žlutá'),
	decode_utf8('Červená'),
	decode_utf8('Modrá'),
);
Readonly::Scalar our $HOUSE_NUMBER_MAX => 100;

our $VERSION = 0.01;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Random address with id of address place.
	$self->{'mode_address_place'} = 0;

	# Random address from OFN examples.
	$self->{'mode_ofn_examples'} = 0;

	# Item id callback.
	$self->{'_counter_id'} = 1;
	$self->{'cb_id'} = sub {
		return $self->{'_counter_id'}++;
	};

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub random {
	my $self = shift;

	my $data;
	if ($self->{'mode_ofn_examples'}) {
		my @ofn_examples = $self->_ofn_examples;
		my $index = int(rand(@ofn_examples));
		$data = $ofn_examples[$index];
	} elsif ($self->{'mode_address_place'}) {
		# TODO Implement random address id
	} else {
		$data = Data::OFN::Address->new(
			'house_number' => int(rand($HOUSE_NUMBER_MAX)) + 1,
			'id' => $self->{'cb_id'}->(),
			'municipality_name' => [
				Data::Text::Simple->new(
					'lang' => 'cs',
					'text' => $MUNICIPALITIES[int(rand(@MUNICIPALITIES))],
				),
			],
			'psc' => (join '', map { int(rand(9)) } 1 .. 5),
			'street_name' => [
				Data::Text::Simple->new(
					'lang' => 'cs',
					'text' => $STREETS[int(rand(@STREETS))],
				),
			],
		),
	}

	return $data;
}

sub _ofn_examples {
	my $self = shift;

	return (
		Test::Shared::Fixture::Data::OFN::Address::Place->new(
			'id' => $self->{'cb_id'}->(),
		),
		Test::Shared::Fixture::Data::OFN::Address::String->new(
			'id' => $self->{'cb_id'}->(),
		),
		Test::Shared::Fixture::Data::OFN::Address::Struct->new(
			'id' => $self->{'cb_id'}->(),
		),
	);
}

1;

__END__
