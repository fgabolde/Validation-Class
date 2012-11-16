# ABSTRACT: Required Directive for Validation Class Field Definitions

package Validation::Class::Directive::Required;

use base 'Validation::Class::Directive';

use Validation::Class::Core;

# VERSION

=head1 SYNOPSIS

    use Validation::Class::Directive::Required;

    my $directive = Validation::Class::Directive::Required->new;

=head1 DESCRIPTION

Validation::Class::Directive::Required is a core validation class field directive
that provides the ability to do some really cool stuff only we haven't
documented it just yet.

=cut

has 'mixin'   => 1;
has 'field'   => 1;
has 'multi'   => 0;
has 'message' => '%s is required';

sub before_validation {

    my ($self, $proto, $field, $param) = @_;

    if (defined $field->{required}) {

        if ($field->{required} && (! defined $param || $param eq '')) {

            $self->error($proto, $field);
            $proto->stash->{'validation.bypass_event'}++;

        }

    }

    return $self;

}

1;