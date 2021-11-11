use ElectricCommander;
use XML::XPath;

my $ec = new ElectricCommander();

sub createJobStep {
    my %resource = %{$_[0]};

    $resource{'instance'} =~ tr/./-/;
    print "Delete resource $resource{'instance'}\n";
    $ec->createJobStep({
        jobStepId        => $ENV{COMMANDER_JOBSTEPID},
        jobStepName      => "~ " . $resource{'instance'},
        parallel         => 1,
        alwaysRun        => 1,
        subprocedure     => "Delete Resource",
        condition        => 1,
        actualParameter  => [{ actualParameterName => 'instance',
                                             value => $resource{'instance'}}]});
}

foreach my $resource ($ec->getResourcesInPool("$[pool]")->findnodes("//resource")) {
    createJobStep({ instance => $resource->findvalue("resourceName")});
}
