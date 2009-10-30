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
    my $self    = $class->instantiate( %properties );
    $self->{_session} = $session;
    return $self;
}

#----------------------------------------------------------------------------

=head2 newFromHashRef ( session, formHashRef )

Create a new Tab object from a serialized hash ref (see L<toHashRef>).

=cut

sub newFromHashRef {
    my ( $class, $session, $hashRef ) = @_;
    my %properties;
    $properties{$class->getProperties} = $hashref->{$class->getProperties};
    my $self    = $class->new( $session, %properties );
    $self->addFromHashRef( $hashRef );
    return $self;
}

#----------------------------------------------------------------------------

=head2 label ( newLabel )

A label to show the user

=cut

#----------------------------------------------------------------------------

=head2 name ( )

The name of the fieldset. Read-only.

=cut

sub name {
    my ( $self ) = @_;
    return $self->next::method;
}

#----------------------------------------------------------------------------

=head2 session ( )

Get the WebGUI::Session attached to this object

=cut

sub session {
    my ( $self ) = @_;
    return $self->{_session};
}

#----------------------------------------------------------------------------

=head2 toHashRef ( )

Serialize this tab to a hashref to be rebuilt later.

=cut

sub toHashRef { 
    my ( $self ) = @_;
    my $hashref = $self->maybe::next::method || {};

    for my $key ( $self->getProperties ) {
        $hashref->{ $key } = $self->get( $key );
    }

    return $hashref;
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
