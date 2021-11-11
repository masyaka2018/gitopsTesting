use ElectricCommander;
use XML::XPath;
my $ec = new ElectricCommander();
$ec->abortOnError(0);

while (true) {
    my $result = $ec->pingResource("$[instance]");
    if ($result) {
        print $result->findnodes_as_string('/');
        print "\n";
        my $state  = $result->findvalue("//state")->value();
        last if ($state eq "alive");
    } else {
        print "Bad resource" . "$[instance]" . "\n";
    }
    sleep 5;
}
