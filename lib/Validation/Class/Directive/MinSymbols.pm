# ABSTRACT: MinSymbols Directive for Validation Class Field Definitions

package Validation::Class::Directive::MinSymbols;

use base 'Validation::Class::Directive';

use Validation::Class::Core;

# VERSION

=head1 SYNOPSIS

    use Validation::Class::Directive::MinSymbols;

    my $directive = Validation::Class::Directive::MinSymbols->new;

=head1 DESCRIPTION

Validation::Class::Directive::MinSymbols is a core validation class field directive
that provides the ability to do some really cool stuff only we haven't
documented it just yet.

=cut

has 'mixin'     => 1;
has 'field'     => 1;
has 'multi'     => 0;
has 'message'   => '%s must contain %s or more non-alphabetic-numeric characters';

sub validate {

    my $self = shift;

    my ($proto, $field, $param) = @_;

    if (defined $field->{min_symbols}) {

        my $min_symbols = $field->{min_symbols};

        if ( $field->{required} || $param ) {

            my @i = ($param =~ /[^a-zA-Z0-9]/g);

            if (@i < $min_symbols) {

                $self->error(@_, $min_symbols);

            }

        }

    }

    return $self;

}

1;