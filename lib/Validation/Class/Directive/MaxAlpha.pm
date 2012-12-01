# ABSTRACT: MaxAlpha Directive for Validation Class Field Definitions

package Validation::Class::Directive::MaxAlpha;

use strict;
use warnings;

use base 'Validation::Class::Directive';

use Validation::Class::Core;

# VERSION

=head1 DESCRIPTION

Validation::Class::Directive::MaxAlpha is a core validation class field directive
that provides the ability to do some really cool stuff only we haven't
documented it just yet.

=cut

has 'mixin'     => 1;
has 'field'     => 1;
has 'multi'     => 0;
has 'message'   => '%s must not contain more than %s alphabetic characters';

sub validate {

    my $self = shift;

    my ($proto, $field, $param) = @_;

    if (defined $field->{max_alpha} && defined $param) {

        my $max_alpha = $field->{max_alpha};

        if ( $field->{required} || $param ) {

            my @i = ($param =~ /[a-zA-Z]/g);

            if (@i > $max_alpha) {

                $self->error(@_, $max_alpha);

            }

        }

    }

    return $self;

}

1;
