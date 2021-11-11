SYSTEM=`uname -s`
if [ "$SYSTEM" != "Linux" ] ; then
    exit
fi

while [ ! -d /mnt/chronic3build ] ; do
    echo "/mnt/chronic3build not accessible, retrying..."
    sleep 10
    sudo mount /mnt 2>&1
done