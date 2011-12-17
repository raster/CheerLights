#!/usr/bin/perl
#

use Device::SerialPort;
use LWP::Simple;


# Note: the portvalue we set below can be got from the Arduino IDE when you 
# upload the sketch... I have a method of automating the port discovery 
# on Mac OS X but I've not tested it on other platforms so I took it out 
# of this version... hardcoding sucks but sometimes it works.

my $portvalue = '/dev/tty.usbserial-A100eFAj';

my $port = Device::SerialPort->new("$portvalue");

$port->databits(8);
$port->baudrate(9600);
$port->parity("none");
$port->stopbits(1);
$|++;

sleep(3);
print "Serial port ready...\n";

@numbers = qw{0 1 2 3 4 5 6 7 8 9};
@colors = qw{red green blue cyan white warmwhite purple magenta yellow orange};


foreach $i (@numbers) {
	print $i . "\t" .  $colors[$i] . "\n";
	$port->write("$i");
	sleep(2);
}

exit;

