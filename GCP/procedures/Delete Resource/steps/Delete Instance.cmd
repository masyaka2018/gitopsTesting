SUCCESS=0
for attempt in 1 2 3 4 5 ; do
    OUTPUT=`/usr/bin/gcloud compute instances delete $[instance] --zone $[zone] --quiet`
    if [ $? -eq 0 ] ; then
        SUCCESS=1
        break
    fi
    if [[ "$OUTPUT" == *"HTTPError 503"* ]] ; then
        echo "Retry after server internal error"
        sleep 5
        continue
    elif [[ "$OUTPUT" == *"Internal Error"* ]] ; then
        echo "Retry after server internal error"
        sleep 5
        continue
    fi
    break
done

if [ $SUCCESS -ne 1 ] ; then
    echo $OUTPUT
fi
