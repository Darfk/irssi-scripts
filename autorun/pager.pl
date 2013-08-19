# $Id: pager.pl,v 1.23 2003/01/27 09:45:16 jylefort Exp $

use Irssi 20020121.2020 ();
$VERSION = "1.1";
%IRSSI = (
    authors     => 'Jean-Yves Lefort',
    contact     => 'jylefort\@brutele.be',
    name        => 'pager',
    description => 'Notifies people if they send you a private message or a DCC chat offer while you are away; runs a shell command configurable via /set if they page you',
    license     => 'BSD',
    changed     => '$Date: 2003/01/27 09:45:16 $ ',
    );

# note:
#
#	Irssi special variables (see IRSSI_DOC_DIR/special_vars.txt) will be
#	expanded in *_notice /set's, and will NOT be expanded in page_command
#	for obvious security reasons.
#
# /set's:
#
#	page_command	a shell command to run if someone sends you the
#			private message 'page' while you are away
#
#	away_notice	a notice to send to someone sending you a private
#			message while you are away
#
#	paged_notice	a notice to send to someone who has just paged you
#
#	dcc_notice	a notice to send to someone who has just sent you
#			a DCC chat offer (this automatically pages you)
#
# changes:
#
#	2003-01-27	release 1.1
#			* notices and commands are now optional
#
#	2002-07-04	release 1.01
#			* things are now printed in the right order
#			* signal_add's uses a reference instead of a string
#
#	2002-04-25	release 1.00
#			* increased version number
#
#	2002-02-06	release 0.20
#			* builtin expand deprecated;
#			  now uses Irssi's special variables
#
#	2002-01-27	release 0.11
#			* uses builtin expand
#
#	2002-01-23	initial release

use strict;
use Irssi::Irc;			# for DCC object

sub message
{

    system("notify-send \"IRC Activity\"");

    # my ($server, $msg, $nick, $address) = @_;
    # if (lc($msg) eq "page")
    # {
    #     my $page_command = Irssi::settings_get_str("page_command");

    #     if ($page_command)
    #     {
    #         system($page_command);
    #     }
    # }
}

Irssi::signal_add_priority("message private", \&message,
			   Irssi::SIGNAL_PRIORITY_LOW + 1);

Irssi::signal_add_priority("message public", \&message,
			   Irssi::SIGNAL_PRIORITY_LOW + 1);
