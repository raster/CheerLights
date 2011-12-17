#!/usr/bin/perl -w
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

while (1) {
	
	my $url	= 'http://api.thingspeak.com/channels/1417/field/1/last.txt';

	my $content = '';
	
	$content = get($url);
	
	if ($content eq '') {
		sleep(60);
		next;
	}
	
	$content =~ s/\s//gsi;
	
	print "Cheerlights are now: $content\n";
	
	my $value = 0;
	
	if ($content eq 'red') {
		$value = 0;
	}
	if ($content eq 'green') {
		$value = 1;
	}
	if ($content eq 'blue') {
		$value = 2;
	}
	if ($content eq 'cyan') {
		$value = 3;
	}
	if ($content eq 'white') {
		$value = 4;
	}
	if ($content eq 'warmwhite') {
		$value = 5;
	}
	if ($content eq 'purple') {
		$value = 6;
	}
	if ($content eq 'magenta') {
		$value = 7;
	}
	if ($content eq 'yellow') {
		$value = 8;
	}
	if ($content eq 'orange') {
		$value = 9;
	}
	
	$port->write("$value");

	sleep(60);

}

__END__
