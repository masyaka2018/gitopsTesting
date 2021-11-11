use strict;
use DateTime;
use ElectricCommander;

my $ec = ElectricCommander->new();

my $buildwatch_list;
my $notify_week;
my $watcher;
my $notify_flag;
my $xpath;

sub next_watcher {

    # Initialize the flag
    $ec->setProperty("/myProcedure/notify_flag", {value => 0});

    # Buildwatch year-wk (next week)
    my $dt = DateTime->now( time_zone => 'US/Pacific' );
    $dt->add( weeks => 1 );
    my $wk = sprintf( "%d-%02d", $dt->year, $dt->week_number );

    # Build-watch list
    $buildwatch_list = "$[/myProcedure/buildwatch-list]";
    $buildwatch_list =~ s/^\n*//;
    $buildwatch_list =~ s/\n+/\n/;

    # Split
    my @watchers = split( /\n/, $buildwatch_list );
    die "Error: No watchers found.  Stopped" unless @watchers;

    # Is it time for the next person?
    $notify_week = "$[/myProcedure/notify-week]";
    if ( $notify_week && $notify_week eq $wk ){
        printf("A notification has already been sent to $[/myProcedure/watcher] for the week of %s\n", 
            $wk);
        exit -1;
    }

    # Get the next watcher and validate the email address.  (The getProperty call will
    # die if the email address is not there.)
    $watcher = shift @watchers;
    $xpath = $ec->getProperty("/myProcedure/emails/$watcher");

    # Re-order the list by putting the watcher at the bottom.
    push( @watchers, $watcher );
    my $new_watchers = join( "\n", @watchers );

    # Store the watcher
    $ec->setProperty("/myProcedure/watcher", {value => "$watcher"});
    printf("watcher:\n%s\n\n", $watcher);

    # Store the Buildwatch week number
    $ec->setProperty("/myProcedure/notify-week", {value => "$wk"});
    printf( "notify_week:\n%s\n\n", $wk );

    # Store the new list
    $ec->setProperty("/myProcedure/buildwatch-list", {value => "$new_watchers"});
    printf("new buildwatch-list:\n%s\n\n", $new_watchers);

    # Set the flag
    $ec->setProperty("/myProcedure/notify_flag", {value => 1});
}
next_watcher();