use strict;
use DateTime;
use ElectricCommander;

# The Wiki status page to be updated.
$::page = 'LoggingBuildFailures';

$::url="http://wiki.electric-cloud.com/";
$::upload_file   = 'upload.wiki';
$::wiki_out_file = 'page.wiki';

#$::jar_file = "//f2/scratch/kthomas/wiki/confluence-cli-1.3.0/release/confluence-cli-1.3.0.jar";
$::jar_file = "/net/f2scratch/kthomas/wiki/confluence-cli-1.3.0/release/confluence-cli-1.3.0.jar";

my $ec      = ElectricCommander->new();
my $xpath   = $ec->getFullCredential('wiki');
$::user     = $xpath->findvalue("//userName");
$::password = $xpath->findvalue("//password");
die "Missing user"     unless $::user;
die "Missing password" unless $::password;


# Download the current page
download_page();

# Generate the newest Build Watch schedule
generate_schedule();

# Insert the new schedule
insert_schedule();

# Write the new page to an upload file
write_page();

# Upload the wiki page file
upload_page();

#-----------------------------------------------------------------
sub download_page {
    ## Retrieve a copy of the current page.

    print "\n---- download_page: $::page\n";

    my $cmd = "java -jar $::jar_file"
        . qq{ --server $::url}
    . qq { --user $::user}
    . qq { --password $::password}
    . qq { --action getPageSource}
    . qq { --space ec}
    . qq { --title "$::page"}
    . qq { --file "$::wiki_out_file"}
    ;
    !system("$cmd") or die "Error: Command failed.  $!.  Stopped";
}


#-----------------------------------------------------------------
sub generate_schedule {

    ## Generate the new Build Watch schedule based on the procedure
    ## properties.

    print "\n---- generate_schedule\n";

    my $build_watch_list = "$[/myProcedure/buildwatch-list]";
    $::watcher = "$[/myProcedure/watcher]";

    my $dt = DateTime->now();

    # Move forward up to the next Monday
    $dt->add( days => 8 - $dt->dow );
    $::watch_date = $dt->mdy;

    print "Current watcher: *$::watcher, $::watch_date*\n\n";

    # Build schedule
    my @names = split(/\n/, $build_watch_list);
    push( @::schedule, " || Name      || Date ||\n");
    foreach my $name (@names) {
        $dt->add( weeks => 1 );
        push( @::schedule, sprintf(" | %-10s | %s |\n", $name, $dt->mdy ) );
    }

    # show
    map { print $_ } @::schedule;
}

#-----------------------------------------------------------------
sub insert_schedule {

    ## Insert the newest schedule into the current page.

    print "\n---- insert_schedule\n";

    open FD, "$::wiki_out_file" or die "Failed to open $::wiki_out_file";

    # Read up to the beginning of the current schedule
    while (<FD>) {
        push( @::wiki_page, $_ );
        last if /^h\d\. Build Watch Schedule/;
    }

    # Insert the newest schedule
    push( @::wiki_page, "

Current Watcher: $::watcher, $::watch_date

*Schedule*
" );
    push(@::wiki_page, @::schedule);
    push(@::wiki_page, "\n\n");


    # Skip the old schedule section.
    #    Skip everything up to the next h header.
    while (<FD>) {
        last if /^h\d\.\s+/;
    }
    push( @::wiki_page, $_ );    # This is the header line of the next section.

    # Read in the rest of the page
    while (<FD>) {
        push( @::wiki_page, $_ );
    }

    close FD;
}

#-----------------------------------------------------------------
sub write_page {

    ## Write the new Wiki page.

    print "\n---- write_page\n";

    print "Creating upload file: $::upload_file\n";

    # Convert output to a scalar and remove excess new-lines.
    my $out = join("", @::wiki_page);
    $out =~ s/\n\n\n+/\n\n/g;

    # Write the upload file
    open(my $fh, '>', "$::upload_file")
        or die "Error: Failed to open $::upload_file.  $!.  Stopped";
    print $fh "$out\n";
    close($fh);
}

#-----------------------------------------------------------------
sub upload_page {

    ## Upload the newly created Wiki page.

    print "\n---- upload_page\n";
    print "Uploading file: $::upload_file\n";

    my $cmd = "java -jar $::jar_file"
        . qq{ --server $::url}
    . qq { --user $::user}
    . qq { --password $::password}
    . qq { --action storePage}
    . qq { --space ec}
    . qq { --title "$::page"}
    . qq { --file "$::upload_file"}
    ;
    !system("$cmd") or die "Error: Command failed.  $!.  Stopped";
}
