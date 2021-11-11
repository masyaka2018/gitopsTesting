set +e
set -x

SUCCESS=0
PREEMPTIBLE=
[ "$[preemptible]" == 'true' ] && PREEMPTIBLE=1


for n in 1 2 3 4 5 6 ; do
    OUTPUT=`/usr/bin/gcloud compute instances create $[instance] \
    ${PREEMPTIBLE:+--preemptible} \
    --scopes https://www.googleapis.com/auth/cloud-platform \
    --project=flow-testing-project \
    --zone $[zone] \
    --impersonate-service-account 979098084317-compute@developer.gserviceaccount.com   \
    --service-account 979098084317-compute@developer.gserviceaccount.com   \
    --machine-type $[type] \
    --image $[image] \
    --boot-disk-type pd-ssd \
    --boot-disk-size=$[diskSizeGB]GB \
    --no-address \
    --network=https://compute.googleapis.com/compute/v1/projects/ops-shared-vpc/global/networks/ops-vpc1 \
    --subnet=https://compute.googleapis.com/compute/v1/projects/ops-shared-vpc/regions/us-west2/subnetworks/testing-cloud-cd-us-west2 \
    --tags=agents,cd-artemis-us-west2,flow-chronic3-cluster,flow-deployment,nat-gw \
    --metadata windows-startup-script-cmd='tzutil /s "Pacific Standard Time" &&  sc start CommanderAgentArtemis' 2>&1`
    CODE=$?
    if [ $CODE -eq 0 ] ; then
        SUCCESS=1
        break
    fi
    if [[ "$OUTPUT" == *"The resource '"*"/$[instance]' already exists"* ]] ; then
        echo "$OUTPUT"
        echo "Treating as good"
        SUCCESS=1
        break
    fi
    if [[ "$OUTPUT" == *"Internal Error"* ]] ; then
        echo "Retrying after internal server error"
        sleep 5
        continue
    fi
    if [[ "$OUTPUT" == *"You do not currently have an active account selected"* ]] ; then
        echo "Retrying after authentication error"
        sleep 5
        continue
    fi
    echo "Retrying after unexpected error: $CODE: $OUTPUT"
    sleep 5
done

if [ $SUCCESS -ne 1 ] ; then
    echo "ERROR: $OUTPUT"
    exit 1
fi
