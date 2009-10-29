package WebGUI::FormBuilder::Tab;

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

Create a new Tab object. C<session> is a WebGUI Session. C<properties> is a 
list of name => value pairs.

=over 4

=item name

Required. A name for the tab. 

=item label

Optional. A label for the tab.

=back

=cut

sub new {
    my ( $class, $session, %properties ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 newFromHashRef ( session, hashRef )

Create a new Tab object from a serialized hashref. See L<toHashRef> for details.

=cut

sub newFromHashRef {
    my ( $class, $session, $hashRef ) = @_;
    
    # TODO
}

#----------------------------------------------------------------------------

=head2 toHashRef ( ) 

Serialize the Tab to a hash reference for storage.

=cut

sub toHashRef {
    my ( $self ) = @_;
    # TODO
}

#----------------------------------------------------------------------------

=head2 toHtml ( )

Render this Tab.

=cut

sub toHtml {
    my ( $self ) = @_;
    
    # Whatever YUI Tabs wants
    my $html    = '<div class="yui-tab">'
                . '<div class="yui-tab-label">' . $self->label . '</div>'
                ;
    $html   .= $self->maybe::next::method;
    $html   .= '</div>';

    return $html;
}

1;
