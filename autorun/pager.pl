use Irssi 20020121.2020 ();
$VERSION = "1.0";
%IRSSI = (
    authors     => 'Tom Payne',
    contact     => 'tom\@darfk.net',
    name        => 'pager',
    description => 'Runs notify-send when user recvs a message.',
    license     => 'BSD',
    changed     => '$Date: 2013/08/19 00:00:00 $ ',
    );

use strict;

sub message
{

    system("notify-send \"IRC Activity\"");
}

Irssi::signal_add_priority("message private", \&message, Irssi::SIGNAL_PRIORITY_LOW + 1);

Irssi::signal_add_priority("message public", \&message, Irssi::SIGNAL_PRIORITY_LOW + 1);
