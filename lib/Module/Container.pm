package Module::Container;
use warnings;
use strict;
our $VERSION = '0.01';
use UNIVERSAL::require;
use Class::Inspector;

sub import {
    my $class          = shift;
    my $pkg            = caller();
    my @import_classes = @_;
 
    for my $import_class ( @import_classes ) {
        $import_class->use or die $@;
        for my $method_name ( @{Class::Inspector->methods($import_class)} ) {
            next if $method_name eq 'import';
            next if $method_name =~ /^_(.+)$/;
            no strict 'refs';
            *{"$pkg\::$method_name"} = sub { $import_class->$method_name(@_) };
        }   
    }   
}   

=head1 NAME

Module::Container - The great new Module::Container!

=head1 SYNOPSIS

    package Module::Hoge;
    use strict;
    use warnings;   
   
    sub hoge { 
        my $class = shift;
        my %args  = validate(@_,{
            hoge => { type => SCALAR },
        });
    } 

    1;

    package main;

    use Module::Container qw(
        Class::Hoge;
    );

    hoge({ 'hello' => 'aaaaaa' });

=head1 AUTHOR

Hiroyuki Yamanaka, C<< <hiroyukimm at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-module-container at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Module-Container>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Module::Container


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Module-Container>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Module-Container>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Module-Container>

=item * Search CPAN

L<http://search.cpan.org/dist/Module-Container/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Hiroyuki Yamanaka.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Module::Container
