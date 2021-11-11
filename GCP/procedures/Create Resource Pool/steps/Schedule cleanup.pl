use ElectricCommander;
use XML::XPath;

my $ec = new ElectricCommander();
$ec->runProcedure("GCP",
                  {procedureName => "Deferred Delete Pool",
                   actualParameter => [
                   { actualParameterName => 'waitFor',   value => '$[deleteAfter]' },
                   { actualParameterName => 'pool',      value => '$[pool]' }
                   ]});
