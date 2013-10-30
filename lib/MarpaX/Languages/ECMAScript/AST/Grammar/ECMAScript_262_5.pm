use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMAScript::AST::Grammar::ECMAScript_262_5;
use MarpaX::Languages::ECMAScript::AST::Impl;
use MarpaX::Languages::ECMAScript::AST::Grammar::ECMAScript_262_5::Program;

# ABSTRACT: ECMAScript-262, Edition 5, grammar

# VERSION

=head1 DESCRIPTION

This modules returns all grammars needed for the ECMAScript 262, Edition 5 grammars written in Marpa BNF, as of L<http://www.ecma-international.org/publications/standards/Ecma-262.htm>.

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMAScript::AST::Grammar::ECMAScript_262_5;

    my $ecma = MarpaX::Languages::ECMAScript::AST::Grammar::ECMAScript_262_5->new();

    my $program = $ecma->program();

=head1 SUBROUTINES/METHODS

=head2 new()

Instance a new object.

=cut

sub new {
  my ($class) = @_;

  my $self  = {};

  bless($self, $class);

  $self->_init();

  return $self;
}

sub _init {
    my ($self) = @_;

    my $grammar = MarpaX::Languages::ECMAScript::AST::Grammar::ECMAScript_262_5::Program->new();
    my $grammar_option = $grammar->grammar_option();
    $grammar_option->{bless_package} = 'ECMAScript_262_5::AST';
    $grammar_option->{source} = \$grammar->content();
    my $recce_option = $grammar->recce_option();
    $self->{_program} = {
	grammar => $grammar,
	impl => MarpaX::Languages::ECMAScript::AST::Impl->new($grammar_option, $recce_option)
    };

}

=head2 program()

Returns the program grammar as a hash reference that is

=over

=item grammar

A MarpaX::Languages::ECMAScript::AST::Grammar::Base object

=item impl

A MarpaX::Languages::ECMAScript::AST::Impl object

=back

=cut

sub program {
    my ($self) = @_;

    return $self->{_program};
}

1;
