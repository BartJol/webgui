package WebGUI::FormBuilder;

use strict;



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



1;
