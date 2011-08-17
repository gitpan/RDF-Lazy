use strict;
use warnings;
package RDF::Lazy::Nil;
BEGIN {
  $RDF::Lazy::Nil::VERSION = '0.062';
}

use base 'RDF::Lazy::Node';

use overload '""' => sub { ""; }, 'bool' => sub { 0 };

sub new {
    my $class = shift;
    bless [ ], $class;
}

1;

__END__
=pod

=head1 NAME

RDF::Lazy::Nil

=head1 VERSION

version 0.062

=head1 AUTHOR

Jakob Voß <voss@gbv.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

