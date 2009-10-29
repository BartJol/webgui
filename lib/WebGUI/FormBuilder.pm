package WebGUI::FormBuilder;

use strict;

use base qw{ 
    WebGUI::FormBuilder::Role::HasFields 
    WebGUI::FormBuilder::Role::HasFieldsets 
    WebGUI::FormBuilder::Role::HasTabs
};


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
    my ( $class, $session, @properties ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 newFromHashRef ( session, formHashRef )

Create a new FormBuilder object from a serialized hash ref (see L<toHashRef>).

=cut

sub newFromHashRef {
    my ( $class, $session, $hashRef ) = @_;

    # TODO
}

#----------------------------------------------------------------------------

=head2 newFromJson ( session, json )

Create a new FormBuilder object from a serialized JSON string (see L<toJson>).

=cut

sub newFromJson {
    my ( $class, $session, $json ) = @_;
    return $class->newFromHashRef( $session, JSON->new->decode( $json );
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

=head2 toHtml ( )

Return the HTML for the form

=cut

sub toHtml {
    my ( $self ) = @_;
    
    my @attrs   = qw{ action method name enctype };
    my $attrs   = join " ", map { qq{$_="} . $self->{$_} . qq{"} } @attrs;

    my $html    = '<form %s>', $attrs;
    $html   .= $self->maybe::next::method;
    $html   .= '</form>';

    return $html;
}

1;
