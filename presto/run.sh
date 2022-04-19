#!/bin/bash

echo $WORKER

PARAM=$WORKER

echo $WORKER_ID

if [ -z $WORKER_ID ];
then
    echo 'NULL LINE'
else
    sed -i "s/node\.id=presto-worker/node\.id=$WORKER_ID/g" /opt/presto/etc/node.properties
fi

if [ "$PARAM" == true ]
then
    sed -i s/coordinator=true/coordinator=false/g /opt/presto/etc/config.properties
    sed -i /node-scheduler.include-coordinator=true/d /opt/presto/etc/config.properties
    sed -i /discovery-server.enabled=true/d /opt/presto/etc/config.properties
    sed -i s/node.id=presto-coordinator/node.id=presto-worker/g /opt/presto/etc/node.properties
    cat /opt/presto/etc/config.properties
    cat /opt/presto/etc/node.properties
fi

/opt/presto/bin/launcher run