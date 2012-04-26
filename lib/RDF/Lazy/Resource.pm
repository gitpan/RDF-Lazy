use strict;
use warnings;
package RDF::Lazy::Resource;
{
  $RDF::Lazy::Resource::VERSION = '0.063';
}
#ABSTRACT: URI reference node (aka resource) in a RDF::Lazy graph

use base 'RDF::Lazy::Node';
use Scalar::Util qw(blessed);
use CGI qw(escapeHTML);

use overload '""' => \&str;

sub new {
    my $class    = shift;
    my $graph    = shift || RDF::Lazy::Node::Graph->new;
    my $resource = shift;

    return unless defined $resource;

    unless (blessed($resource) and $resource->isa('RDF::Trine::Node::Resource')) {
        $resource = RDF::Trine::Node::Resource->new( $resource );
        return unless defined $resource;
    }

    return bless [ $resource, $graph ], $class;
}

sub str {
    shift->trine->uri_value;
}

*uri  = *str;

*href = *RDF::Lazy::Node::esc;

1;


__END__
=pod

=head1 NAME

RDF::Lazy::Resource - URI reference node (aka resource) in a RDF::Lazy graph

=head1 VERSION

version 0.063

=head1 DESCRIPTION

You should not directly create instances of this class.
See L<RDF::Lazy::Node> for general node properties.

=head1 METHODS

=head2 str

Return the URI value of this node as string. Is also used for comparing nodes.

=head2 uri

Alias for method 'str'.

=head2 href

Return the HTML-escaped URI value. Alias for method 'esc'.

=head1 AUTHOR

Jakob Voß <voss@gbv.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

