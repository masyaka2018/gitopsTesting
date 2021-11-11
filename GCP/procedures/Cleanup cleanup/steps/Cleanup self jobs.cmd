for n in /mnt/chronic3build/cleanupcleanup-* ; do
    NAME=`basename $n`
    if [ $NAME != $[/myJob/jobName] ] ; then
        ectool deleteJob $NAME
        rm -rf $n
    fi
done

