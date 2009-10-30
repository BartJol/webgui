package WebGUI::FormBuilder;

use strict;
use Class::C3;

use base qw{ 
    WebGUI::FormBuilder::Role::HasFields 
    WebGUI::FormBuilder::Role::HasFieldsets 
    WebGUI::FormBuilder::Role::HasTabs
};

use WebGUI::Definition (
    properties  => {
        action      => { },
        enctype     => { },
        method      => { },
        name        => { },
    },
);

=head1 METHODS

#----------------------------------------------------------------------------

=head2 new ( session, properties )

Create a new FormBuilder object. C<properties> is a list of name => value pairs

=over 4

=item name

The name of the form. Optional, but recommended.

=item action

The URL to submit the form to.

=item method

The HTTP method to submit the form with. Defaults to POST. 

=item enctype

The encoding type to use for the form. Defaults to "multipart/form-data". The 
other possible value is "application/x-www-form-urlencoded".

=back

=cut

sub new {
    my ( $class, $session, %properties ) = @_;
    $properties{ method     } ||= "POST";
    $properties{ enctype    } ||= "multipart/form-data";
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

=head2 newFromJson ( session, json )

Create a new FormBuilder object from a serialized JSON string (see L<toJson>).

=cut

sub newFromJson {
    my ( $class, $session, $json ) = @_;
    return $class->newFromHashRef( $session, JSON->new->decode( $json ) );
}

#----------------------------------------------------------------------------

=head2 action ( [ newAction ] )

Get or set the action property / HTML attribute.

=cut

#----------------------------------------------------------------------------

=head2 enctype ( [ newEnctype ] )

Get or set the enctype property / HTML attribute.

=cut

#----------------------------------------------------------------------------

=head2 method ( [ newMethod ] )

Get or set the method property / HTML attribute.

=cut

#----------------------------------------------------------------------------

=head2 name ( [ newName ] )

Get or set the name property / HTML attribute.

=cut

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

Return a serialized hash ref of information to re-create this form. This
hashref can be given to L<newFromHashRef>. 

If you want to store the serialized form to a database, see L<toJson>

=cut

sub toHashRef {
    my ( $self ) = @_;

    my $hashref = $self->maybe::next::method;
    for my $key ( $self->getProperties ) {
        $hashref->{ $key } = $self->get( $key );
    }

    return $hashref;
}

#----------------------------------------------------------------------------

=head2 toHtml ( )

Return the HTML for the form

=cut

sub toHtml {
    my ( $self ) = @_;
    
    my @attrs   = qw{ action method name enctype };
    my $attrs   = join " ", map { qq{$_="} . $self->get($_) . qq{"} } @attrs;

    my $html    = '<form %s>', $attrs;
    $html   .= $self->maybe::next::method;
    $html   .= '</form>';

    return $html;
}

#----------------------------------------------------------------------------

=head2 toJson ( )

Return a JSON serialized form of this object to be stored in a database. To
restore this object, use L<newFromJson>

=cut

sub toJson {
    my ( $self ) = @_;
    return JSON->new->encode( $self->toHashRef );
}

#----------------------------------------------------------------------------

=head2 toTemplateVars ( prefix, [var] )

Get the template variables for the form's controls with the given prefix. 
C<var> is an optional hashref to add the variables to.

=cut

sub toTemplateVars {
    my ( $self, $prefix, $var ) = @_;
    $prefix ||= "form";
    $var ||= {};

    # TODO
    # $prefix_header
    # $prefix_footer
    # $prefix_field_loop
    #   name    -- for comparisons
    #   field
    #   label   -- includes hoverhelp
    #   label_nohover
    #   pretext
    #   subtext
    #   hoverhelp   -- The text. For use with label_nohover
    # $prefix_field_$fieldName
    # $prefix_label_$fieldName
    # $prefix_fieldset_loop
    #   name
    #   legend
    #   label       -- same as legend
    #   $prefix_field_loop
    #       ...
    #   $prefix_fieldset_loop
    #       ...
    #   $prefix_tab_loop
    #       ...
    # $prefix_fieldset_$fieldsetName
    #   ...
    # $prefix_tab_loop
    #   name
    #   label
    #   $prefix_field_loop
    #       ...
    #   $prefix_fieldset_loop
    #       ...
    #   $prefix_tab_loop
    #       ...
    # $prefix_tab_$tabName
    #   ...
    return $var;
}

=head1 TEMPLATES

=head2 Default View

This is a Template Toolkit template that will recreate the default toHtml() view
of a form.

 # TODO

=cut

1;
