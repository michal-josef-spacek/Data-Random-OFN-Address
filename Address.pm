package Data::Random::OFN::Address;

use strict;
use warnings;

use Class::Utils qw(set_params);

our $VERSION = 0.01;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub random {
	my $self = shift;

	my $data;

	return $data;
}

1;

__END__
