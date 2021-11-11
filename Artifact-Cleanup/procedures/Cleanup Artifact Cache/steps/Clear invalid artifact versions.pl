use strict;
use warnings;
use ElectricCommander;

$| = 1; # Turn off output buffering.

my $dryRun = $[dryRun];
my $ec = new ElectricCommander({debug => $[debug]});
my $response;

# We're going to try and find a valid cache directory. Mark the directory as invalid for now
# and update it only once we find and validate the directory.
$ec->setProperty("/myJob/cacheDirectoryIsValid", {value => 0});

# Check the environment variable COMMANDER_ARTIFACT_CACHE.
my $cacheEnv = "COMMANDER_ARTIFACT_CACHE";
my $dir;
if (defined($ENV{$cacheEnv})) {
    $dir = $ENV{$cacheEnv};
    print "Cache directory found in environment: \"$dir\".\n";
} else {
    # We came up empty; give up since we don't know what directory to cleanup.
    die "ERROR: No cache directory was found in the environment.\n";
}

if (! -d $dir) {
    # The directory can't be read; no need to try to clean it up.
    die "ERROR: Cannot access directory \"$dir\".\n";
}

$ec->setProperty("/myJob/actualCacheDirectory", {value => $dir});
$ec->setProperty("/myJob/cacheDirectoryIsValid", {value => 1});
if ($dryRun) {
    print "Would call cleanupArtifactCache on \"$dir\".\n";
} else {
    print "Cleaning up artifact cache.\n";
    $ec->cleanupArtifactCache($dir);
}