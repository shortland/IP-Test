#!/usr/bin/perl

print "Type in your exact public IP address, then press enter.\n\n";
chomp ($ip = <STDIN>);
print "Max timeout (seconds), for milliseconds add a decimal (.5 = 500 milliseconds, 5 = 5 seconds)\nSuggested: 1 second.\n\n";
chomp ($timeout = <STDIN>);
print "Running! Will close if timeout exceeded or IP changes!\n\n --RUNNING--";
curling:
$resp = `curl -s 'http://ipecho.net/plain' --connect-timeout '$timeout'`;
if ($resp =~ /$ip/){
	goto curling
} else {
    `killall -KILL firefox`;
    `killall -KILL Safari`;
    `killall -KILL Terminal`;
die "\n";
    exit;
}