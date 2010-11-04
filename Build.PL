use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Module::Container',
    license             => 'perl',
    dist_author         => q{Hiroyuki Yamanaka <hiroyukimm at gmail.com>},
    dist_version_from   => 'lib/Module/Container.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Module-Container-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
