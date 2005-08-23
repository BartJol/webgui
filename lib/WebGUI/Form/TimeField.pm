package WebGUI::Form::TimeField;

=head1 LEGAL

 -------------------------------------------------------------------
  WebGUI is Copyright 2001-2005 Plain Black Corporation.
 -------------------------------------------------------------------
  Please read the legal notices (docs/legal.txt) and the license
  (docs/license.txt) that came with this distribution before using
  this software.
 -------------------------------------------------------------------
  http://www.plainblack.com                     info@plainblack.com
 -------------------------------------------------------------------

=cut

use strict;
use base 'WebGUI::Form::Text';
use WebGUI::DateTime;
use WebGUI::Form::Button;
use WebGUI::Form::Hidden;
use WebGUI::International;
use WebGUI::Session;
use WebGUI::Style;

=head1 NAME

Package WebGUI::Form::TimeField

=head1 DESCRIPTION

Creates a time form field. 

=head1 SEE ALSO

This is a subclass of WebGUI::Form::Text.

=head1 METHODS 

The following methods are specifically available from this class. Check the superclass for additional methods.

=cut

#-------------------------------------------------------------------

=head2 definition ( [ additionalTerms ] )

See the superclass for additional details.

=head3 additionalTerms

The following additional parameters have been added via this sub class.

=head4 maxlength

Defaults to 8. Determines the maximum number of characters allowed in this field.

=head4 size

Default to 8. Determines how many characters wide the field wlll be.

=cut

sub definition {
	my $class = shift;
	my $definition = shift || [];
	push(@{$definition}, {
		maxlength=>{
			defaultValue=>8
			},
		size=>{
			defaultValue=>8
			}
		});
	return $class->SUPER::definition($definition);
}


#-------------------------------------------------------------------

=head2 getName ()

Returns the human readable name or type of this form control.

=cut

sub getName {
        return WebGUI::International::get("971","WebGUI");
}


#-------------------------------------------------------------------

=head2 getValueFromPost ( )

Returns the number of seconds since 00:00:00 on a 24 hour clock. Note, this will adjust for the user's time offset in the reverse manner that the form field adjusts for it in order to make the times come out appropriately.

=cut

sub getValueFromPost {
	my $self = shift;
	return WebGUI::DateTime::timeToSeconds($session{cgi}->param($self->{name}))-($session{user}{timeOffset}*3600);
}

#-------------------------------------------------------------------

=head2 toHtml ( )

Renders a time field.

=cut

sub toHtml {
        my $self = shift;
	my $value = WebGUI::DateTime::secondsToTime($self->{value});
	WebGUI::Style::setScript($session{config}{extrasURL}.'/inputCheck.js',{ type=>'text/javascript' });
	$self->{extras} .= ' onkeyup="doInputCheck(this.form.'.$self->{name}.',\'0123456789:\')"';
	return $self->SUPER::toHtml
		.WebGUI::Form::Button->new(
			id=>$self->{id},
			extras=>'style="font-size: 8pt;" onClick="window.timeField = this.form.'.$self->{name}.';clockSet = window.open(\''.$session{config}{extrasURL}. '/timeChooser.html\',\'timeChooser\',\'WIDTH=230,HEIGHT=100\');return false"',
			value=>WebGUI::International::get(970)
			)->toHtml;
}

#-------------------------------------------------------------------

=head2 toHtmlAsHidden ( )

Renders the field as a hidden field.

=cut

sub toHtmlAsHidden {
	my $self = shift;
	return WebGUI::Form::Hidden->new(
		name=>$self->{name},
		value=>secondsToTime($self->{value})
		)->toHtmlAsHidden;
}




1;

