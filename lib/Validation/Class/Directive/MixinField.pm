# ABSTRACT: MixinField Directive for Validation Class Field Definitions

package Validation::Class::Directive::MixinField;

use strict;
use warnings;

use base 'Validation::Class::Directive';

use Validation::Class::Util;

# VERSION

=head1 SYNOPSIS

    use Validation::Class::Simple;

    my $rules = Validation::Class::Simple->new(
        fields => {
            first_name => {
                required => 1,
                filters  => ['trim', 'strip']
            },
            last_name => {
                mixin_field => 'first_name'
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

Validation::Class::Directive::MixinField is a core validation class field
directive that determines what fields will be used as templates and merged with
the associated field.

=cut

has 'mixin' => 0;
has 'field' => 1;
has 'multi' => 0;

1;
