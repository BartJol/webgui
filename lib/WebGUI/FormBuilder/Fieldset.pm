package WebGUI::FormBuilder::Fieldset;

use strict;
use Class::C3;
use base qw{
    WebGUI::FormBuilder::Role::HasFields
    WebGUI::FormBuilder::Role::HasFieldsets
    WebGUI::FormBuilder::Role::HasTabs
};

=head1 METHODS

=cut

#----------------------------------------------------------------------------

=head2 new ( session, properties ) 

Create a new Fieldset object. C<session> is a WebGUI Session. C<properties> is
a list of name => value pairs.


=over 4

=item name

Required. The name of the fieldset.

=item legend

Optional. A label to show the user.

=back

=cut

sub new {
    my ( $class, $session, %properties ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 newFromHashRef ( session, hashref )

Create a new Fieldset object from the given hashref. See L<toHashRef> for 
information.

=cut

sub newFromHashRef {
    my ( $class, $session, $hashRef ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 toHashRef ( )

Serialize this tab to a hashref to be rebuilt later.

=cut

sub toHashRef { 
    my ( $self ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 toHtml ( )

Returns the HTML to render the fieldset.

=cut

sub toHtml {
    my ( $self ) = @_;

    my $html = '<fieldset><legend>' . $self->legend . '</legend>';
    $html   .= $self->maybe::next::method;
    $html   .= '</fieldset>';

    return $html;
}

1;
