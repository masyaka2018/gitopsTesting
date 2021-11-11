use ElectricCommander;
use XML::XPath;

my $ec = new ElectricCommander();
$ec->runProcedure("GCP",
                  {procedureName => "Deferred Delete Resource",
                   actualParameter => [
                   { actualParameterName => 'waitFor',   value => '$[deleteAfter]' },
                   { actualParameterName => 'instance',  value => '$[instance]' }
                   ]});
