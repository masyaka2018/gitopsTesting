use strict;
use ElectricCommander;
use DateTime;
use File::Path;

my $ec = new ElectricCommander();

my $result = $ec->findObjects("job", {
                maxIds => "1000",
                filter => [{propertyName => "jobName",
                                operator => "like",
                                operand1 => "cleanup-gcp-%"},
                           {propertyName => "status",
                                operator => "equals",
                                operand1 => "completed"}]});
my @nodes = $result->findnodes("//object");
foreach my $node (@nodes) {
    my $name = $node->findvalue('job/jobName');
    printf("Deleting job %s\n", $name);
    $ec->deleteJob($name, {waitForDeleteToComplete => 0});
    rmtree "/mnt/chronic3build/$name";
}
