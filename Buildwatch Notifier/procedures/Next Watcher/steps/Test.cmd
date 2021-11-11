# Show the Email-Notification run conditions.
# This is for debugging why the Friday email is not going out.

echo notify-flag: $[/javascript myProcedure["notify-flag"]]
echo update_wiki_only: $[/javascript myJob.update_wiki_only]
