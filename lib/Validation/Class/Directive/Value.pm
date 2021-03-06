# ABSTRACT: Value Directive for Validation Class Field Definitions

package Validation::Class::Directive::Value;

use strict;
use warnings;

use base 'Validation::Class::Directive';

use Validation::Class::Util;

# VERSION

=head1 DESCRIPTION

Validation::Class::Directive::Value is a core validation class field directive
that holds the absolute value of the associated field.

=cut

has 'mixin'        => 1;
has 'field'        => 1;
has 'multi'        => 1;
# ensure most core directives execute before this one
has 'dependencies' => sub {{
    normalization => [qw(
        default
    )],
    validation    => [qw(
        alias
        between
        depends_on
        error
        errors
        filtering
        filters
        label
        length
        matches
        max_alpha
        max_digits
        max_length
        max_sum
        min_alpha
        min_digits
        min_length
        min_sum
        mixin
        mixin_field
        multiples
        name
        options
        pattern
        readonly
        required
        toggle
    )]
}};

sub after_validation {

    my ($self, $proto, $field, $param) = @_;

    # set the field value

    $field->{value} = $param || '';

    return $self;

}

sub before_validation {

    my ($self, $proto, $field, $param) = @_;

    # set the field value

    $field->{value} = $param || '';

    return $self;

}

sub normalize {

    my ($self, $proto, $field, $param) = @_;

    # set the field value

    $field->{value} = $param || '';

    return $self;

}

1;
