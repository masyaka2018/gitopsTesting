#!/bin/bash
MSG="$[/myProject/procedures/Next Watcher/slack_ids/$[/myProject/procedures/Next Watcher/watcher]] - A reminder that this is your week for Build Watch."
SLACK_URL=$[/myProcedure/slack_url]

echo "$MSG"

curl --insecure -H "Content-Type: application/json" \
     -X POST \
     -d "{ \"text\" : \"$MSG\" , \"link_names\" : \"true\"}" \
     $SLACK_URL