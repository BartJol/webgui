package WebGUI::FormBuilder::Role::HasFieldsets;

use strict;
use Class::C3;
use Scalar::Util ();

=head1 METHODS

=cut

#----------------------------------------------------------------------------

=head2 addFieldset( properties )

Add a fieldset. C<properties> is a list of name => value pairs. Returns the
new WebGUI::FormBuilder::Fieldset object.

=over 4 

=item name

Required. The name of the fieldset.

=item legend

The label for the fieldset.

=back

=head2 addFieldset( object, overrideProperties )

Add a fieldset. C<object> is any object that implements the C<WebGUI::FormBuilder::Role::HasFields>
class. Any fieldsets or tabs in the C<object> will also be added. C<overrideProperties> is a list
of name => value pairs to override properties in the C<object> (such as name and label).

=cut

sub addFieldset {
    if ( Scalar::Util::blessed( $_[1] ) ) {
        my ( $self, $object, %properties ) = @_;
        $properties{ name   } ||= $object->can('name')      ? $object->name     : "";
        $properties{ legend } ||= $object->can('legend')    ? $object->legend   : "";
        my $fieldset = WebGUI::FormBuilder::Fieldset->new( $self->session, %properties );
        # TODO Translate to a Fieldset object
        # HasTabs
        # HasFieldsets
        # HasFields
    }
    else {
        my ( $self, @properties ) = @_;
        my $fieldset = WebGUI::FormBuilder::Fieldset->new( $self->session, @properties );
        push @{$self->{_fieldsets}}, $fieldset;
        $self->{_fieldsetsByName}{ $fieldset->name } = $fieldset;
        return $fieldset;
    }
}

#----------------------------------------------------------------------------

=head2 addFromHashRef( hashRef )

Add the fieldsets from the given serialized hashRef. See C<toHashRef> for more
information.

=cut

sub addFromHashRef {
    my ( $self, $hashref ) = @_;

    for my $fieldset ( @{$hashref->{fieldsets}} ) {
        my $fs  = WebGUI::FormBuilder::Fieldset->newFromHashref( $self->session, $fieldset );
        $self->addFieldset( $fs );
    }

    $self->maybe::next::method;
}

#----------------------------------------------------------------------------

=head2 deleteFieldset ( name )

Delete a fieldset by name. Returns the fieldset deleted.

=cut

sub deleteFieldset {
    my ( $self, $name ) = @_;
    my $fieldset    = delete $self->{_fieldsetsByName}{$name};
    for ( my $i = 0; $i < scalar @{$self->{_fieldsets}}; $i++ ) {
        my $testFieldset    = $self->{_fieldsets}[$i];
        if ( $testFieldset->name eq $name ) {
            splice @{$self->{fieldsets}}, $i, 1;
        }
    }
    return $fieldset;
}

#----------------------------------------------------------------------------

=head2 getFieldset ( name )

Get a fieldset object by name

=cut

sub getFieldset {
    my ( $self, $name ) = @_;
    return $self->{_fieldsetsByName}{$name};
}

#----------------------------------------------------------------------------

=head2 getFieldsets ( )

Get all fieldset objects. Returns the arrayref of fieldsets.

=cut

sub getFieldsets {
    my ( $self ) = @_;
    return $self->{_fieldsets};
}

#----------------------------------------------------------------------------

=head2 toHashRef ( )

Serialize the tabs in this object

=cut

sub toHashRef {
    my ( $self ) = @_;
    my $hashref         = $self->maybe::next::method || {};
    $hashref->{tabs}    = [];

    for my $tab ( @{$self->{_tabs}} ) {
        push @{$hashref->{tabs}}, $tab->toHashRef;
    }

    return $hashref;
}

#----------------------------------------------------------------------------

=head2 toHtml ( ) 

Render the fieldsets in this part of the form

=cut

sub toHtml {
    my ( $self ) = @_;
    my $html    = $self->maybe::next::method;
    for my $fieldset ( @{$self->{_fieldsets}} ) {
        $html .= $fieldset->toHtml;
    }
    return $html;
}

1;
