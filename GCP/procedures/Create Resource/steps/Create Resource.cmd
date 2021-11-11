GCP_INSTANCE=`echo $[instance] | /usr/bin/tr '[:upper:]' '[:lower:]'`
IPADDR=`/usr/bin/gcloud compute instances describe $[instance] --zone $[zone] --format='get(networkInterfaces[0].networkIP)'`
/opt/chronic/install/bin/ectool \
    createResource $[instance] \
    --hostName $IPADDR \
    --port 7801 \
    --stepLimit "$[stepLimit]"
/opt/chronic/install/bin/ectool \
    setProperty /resources/$[instance]/image $[image]