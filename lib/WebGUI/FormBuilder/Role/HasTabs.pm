package WebGUI::FormBuilder::Role::HasTabs;

use strict;
use Class::C3;
use Scalar::Util ();

=head1 METHODS

=cut

#----------------------------------------------------------------------------

=head2 addTab ( properties )

Add a tab. C<properties> is a list of name => value pairs to be passed to
L<WebGUI::FormBuilder::Tab>.

=head2 addTab ( object, propertiesOverrides )

Add a tab. C<object> is any object that implements L<WebGUI::FormBuilder::Role::HasFields>.
Any sub-tabs or fieldsets will also be included.

=cut

sub addTab {
    if ( Scalar::Util::blessed( $_[1] ) ) {
        my ( $self, $object, %properties ) = @_;
        $properties{ name   } ||= $object->can('name')      ? $object->name     : "";
        $properties{ label  } ||= $object->can('label')     ? $object->label    : "";
        my $tab = WebGUI::FormBuilder::Tab->new( $self->session, %properties );
        # TODO Translate to a Tab object
        # HasTabs
        # HasFieldsets
        # HasFields
    }
    else {
        my ( $self, @properties ) = @_;
        my $tab = WebGUI::FormBuilder::Tab->new( $self->session, @properties );
        push @{$self->{_tabs}}, $tab;
        $self->{_tabsByName}{$tab->name} = $tab;
        return $tab;
    }
}

#----------------------------------------------------------------------------

=head2 deleteTab ( name )

Delete a tab by name. Returns the tab deleted.

=cut

sub deleteTab {
    my ( $self, $name ) = @_;
    my $tab    = delete $self->{_tabsByName}{$name};
    for ( my $i = 0; $i < scalar @{$self->{_tabs}}; $i++ ) {
        my $testTab    = $self->{_tabs}[$i];
        if ( $testTab->name eq $name ) {
            splice @{$self->{tabs}}, $i, 1;
        }
    }
    return $tab;
}

#----------------------------------------------------------------------------

=head2 getTab ( name )

Get a tab object by name

=cut

sub getTab {
    my ( $self, $name ) = @_;
    return $self->{_tabsByName}{$name};
}

#----------------------------------------------------------------------------

=head2 getTabs ( )

Get all tab objects. Returns the arrayref of tabs.

=cut

sub getTabs {
    my ( $self ) = @_;
    return $self->{_tabs};
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

Render the tabs in this part of the form

=cut

sub toHtml {
    my ( $self ) = @_;
    my $html    = $self->maybe::next::method;
    for my $tab ( @{$self->{_tabs}} ) {
        $html .= $tab->toHtml;
    }
    return $html;
}

1;
