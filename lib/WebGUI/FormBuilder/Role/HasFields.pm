package WebGUI::FormBuilder::Role::HasFields;

use strict;
use Class::C3;
use Scalar::Util ();


=head1 METHODS

#----------------------------------------------------------------------------

=head2 addFromHashRef( hashRef )

Add the tabs from the given serialized hashRef. See C<toHashRef> for more
information.

=cut

sub addFromHashRef {
    my ( $self, $hashref ) = @_;

    for my $field ( @{$hashref->{fields}} ) {
        # TODO Create Field object
        # $self->addField( $fieldObject );
    }

    $self->maybe::next::method;
}

#----------------------------------------------------------------------------

=head2 addField ( WebGUI::Form::Control )

Add a field. Any WebGUI::Form::Control object.

=head2 addField ( type, properties )

Add a field. C<type> is a class name, optionally without 'WebGUI::Form::'. 
C<properties> is a list of name => value pairs.

Returns the field object

=over 4

=item name

Required. The name of the field in the form.

=back

=cut

sub addField {
    my ( $self, $type, @properties ) = @_;
    my $field;

    if ( Scalar::Util::blessed( $type ) ) {
        $field = $type;
    }
    else {
        # TODO: Create the field object
    }

    push @{$self->{_fields}}, $field;
    $self->{_fieldsByName}{ $field->name } = $field; # TODO: Must allow multiple fields per name
    return $field;
}

#----------------------------------------------------------------------------

=head2 getField ( name )

Get a field by name. Returns the field object.

=cut

sub getField {
    my ( $self, $name ) = @_;
    return $self->{_fieldsByName}{$name};
}

#----------------------------------------------------------------------------

=head2 getFields ( )

Get all the fields in this section. Does not include fieldsets or tabs if any.

Returns an arrayref of field objects in order. Altering this arrayref alters
the order.

=cut

sub getFields {
    my ( $self ) = @_;
    return $self->{_fields};
}

#----------------------------------------------------------------------------

=head2 getFieldsRecursive ( )

Get all the fields in this section, including fieldsets and tabs.

=cut

sub getFieldsRecursive {
    my ( $self ) = @_;
    
    my $fields  = [ @{$self->getFields} ]; # New arrayref, but same field objects

    if ( $self->isa('WebGUI::FormBuilder::Role::HasFieldsets') ) {
        # Add $self->{_fieldsets} fields
    }
    if ( $self->isa('WebGUI::FormBuilder::Role::HasTabs') ) {
        # Add $self->{_tabs} fields
    }
    
    return $fields;
}

#----------------------------------------------------------------------------

=head2 toHashRef ( )

Serialize the fields in this object

=cut

sub toHashRef {
    my ( $self ) = @_;
    my $hashref         = $self->maybe::next::method || {};
    $hashref->{fields}    = [];

    for my $field ( @{$self->{_fields}} ) {
        push @{$hashref->{fields}}, $field->toHashRef;
    }

    return $hashref;
}

#----------------------------------------------------------------------------

=head2 toHtml ( )

Render the fields in this part of the form.

=cut

sub toHtml {
    my ( $self ) = @_;

    # This will always be the first one called, so no maybe::next::method
    my $html    = '';
    for my $field ( @{$self->{_fields}} ) {
        $html .= $field->toHtmlWithWrapper;
    }

    return $html;
}

1;
