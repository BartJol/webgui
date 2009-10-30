package WebGUI::FormBuilder::Fieldset;

use strict;
use Class::C3;
use base qw{
    WebGUI::FormBuilder::Role::HasFields
    WebGUI::FormBuilder::Role::HasFieldsets
    WebGUI::FormBuilder::Role::HasTabs
};

use WebGUI::Definition (
    properties      => {
        name        => { },
        label       => { },
    },
);

=head1 METHODS

=cut

#----------------------------------------------------------------------------

=head2 new ( session, properties ) 

Create a new Fieldset object. C<session> is a WebGUI Session. C<properties> is
a list of name => value pairs.


=over 4

=item name

Required. The name of the fieldset. Cannot be changed after initially set, 
otherwise the parent <form> may not work correctly.

=item label

Optional. A label to show the user.

=item legend

Optional. A synonym for C<label>.

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

Create a new FormBuilder object from a serialized hash ref (see L<toHashRef>).

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

=head2 legend ( newLegend )

A synonym for label.

=cut

sub legend {
    my ( $self, @args ) = @_;
    return $self->label( @args );
}

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

Serialize this fieldset to a hashref to be rebuilt later.

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
