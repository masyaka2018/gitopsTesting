use ElectricCommander;
use XML::XPath;

my $ec = new ElectricCommander();

sub createJobStep {
    my %resource = %{$_[0]};

    if (!exists($resource{'image'})) {
        print "ERROR: missing image\n";
        exit 1;
    }

    if (!exists($resource{'stepLimit'})) {
        $resource{'stepLimit'} = '1';
    }
    if (!exists($resource{'type'})) {
        $resource{'type'} = 'n1-standard-2';
    }

    $resource{'instance'} =~ tr/./-/;
    print "Create resource $resource{'instance'}\n";
    $ec->createJobStep({
        jobStepId        => $ENV{COMMANDER_JOBSTEPID},
        jobStepName      => "~ " . $resource{'instance'},
        parallel         => 1,
        subprocedure     => "Create Resource",
        condition        => 1,
        actualParameter  => [{ actualParameterName => 'image',
                                             value => $resource{'image'} },
                             { actualParameterName => 'instance',
                                             value => $resource{'instance'} },
                             { actualParameterName => 'stepLimit',
                                             value => $resource{'stepLimit'} },
                             { actualParameterName => 'type',
                                             value => $resource{'type'} },
                             { actualParameterName => 'pool',
                                             value => $resource{'pool'} },
                             { actualParameterName => 'preemptible',
                                             value => $resource{'preemptible'} }]});
}

foreach (1..$[count]) {
  createJobStep({
      instance    => "$[pool]" . "-$_",
      image       => "$[image]",
      type        => "$[type]",
      pool        => "$[pool]",
      preemptible => "$[preemptible]"
  });
}
