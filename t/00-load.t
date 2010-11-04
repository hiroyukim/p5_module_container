#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Module::Container' ) || print "Bail out!
";
}

diag( "Testing Module::Container $Module::Container::VERSION, Perl $], $^X" );
