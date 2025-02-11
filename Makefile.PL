use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Generate random data for OFN address.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Data-Random-OFN-Address';
perl_version 5.008;
readme_from 'Address.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0;
requires 'Data::OFN::Address' => 0;
requires 'Data::Text::Simple' => 0;
requires 'Mo::utils' => 0.06;
requires 'Readonly' => 0;
requires 'Test::Shared::Fixture::Data::OFN::Address::Place' => 0;
requires 'Test::Shared::Fixture::Data::OFN::Address::String' => 0;
requires 'Test::Shared::Fixture::Data::OFN::Address::Struct' => 0;
requires 'Unicode::UTF8' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Data-Random-OFN-Address/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Data-Random-OFN-Address';
resources 'repository' => 'git://github.com/michal-josef-spacek/Data-Random-OFN-Address';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
