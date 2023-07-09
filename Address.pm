package Data::Random::OFN::Address;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::OFN::Address;
use Data::Text::Simple;
use Readonly;
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
		Data::OFN::Address->new(
			'address_place' => 'https://linked.cuzk.cz/resource/ruian/adresni-misto/16135661',
			'id' => $self->{'cb_id'}->(),
		),
		Data::OFN::Address->new(
			'house_number' => 12,
			'house_number_type' => decode_utf8('č.p.'),
			'id' => $self->{'cb_id'}->(),
			'municipality_name' => [
				Data::Text::Simple->new(
					'lang' => 'cs',
					'text' => decode_utf8('Horní Datová'),
				),
			],
			# XXX not standard, what about it?
			'note' => decode_utf8('dole u řeky'),
			'psc' => '33101',
			'street_name' => [
				Data::Text::Simple->new(
					'lang' => 'cs',
					'text' => decode_utf8('Hlavní'),
				),
			],
		),
		Data::OFN::Address->new(
			'id' => $self->{'cb_id'}->(),
			'text' => [
				Data::Text::Simple->new(
					'lang' => 'cs',
					'text' => decode_utf8('Pod Panskou strání 262/12, Chvojkonosy, 33205 Lysostírky'),
				),
			],
		),
	);
}

1;

__END__
