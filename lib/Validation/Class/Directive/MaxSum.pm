# ABSTRACT: MaxSum Directive for Validation Class Field Definitions

package Validation::Class::Directive::MaxSum;

use strict;
use warnings;

use base 'Validation::Class::Directive';

use Validation::Class::Util;

# VERSION

=head1 SYNOPSIS

    use Validation::Class::Simple;

    my $rules = Validation::Class::Simple->new(
        fields => {
            invoice_total => {
                max_sum => 10000
            }
        }
    );

    # set parameters to be validated
    $rules->params->add($parameters);

    # validate
    unless ($rules->validate) {
        # handle the failures
    }

=head1 DESCRIPTION

Validation::Class::Directive::MaxSum is a core validation class field directive
that validates the numeric value of the associated parameters.

=cut

has 'mixin'     => 1;
has 'field'     => 1;
has 'multi'     => 0;
has 'message'   => '%s must be less than %s';

sub validate {

    my $self = shift;

    my ($proto, $field, $param) = @_;

    if (defined $field->{max_sum} && defined $param) {

        my $max_sum = $field->{max_sum};

        if ( $field->{required} || $param ) {

            if (int($param) > int($max_sum)) {

                $self->error(@_, $max_sum);

            }

        }

    }

    return $self;

}

1;
