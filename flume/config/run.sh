#!/bin/bash

echo $configFile
echo $agentName
echo $avroHost
echo $spoolDir

equal_str="="

mkdir -p /conf


if [ -z $agentName ] && [-z $configFile]
then
    echo "Empty Config File"
else
    echo "# Not Empty Config File"
    bash /opt/flume/bin/flume-ng agent -Xms1000m -Xmx2000m --conf conf --conf-file /conf/${configFile} --name ${agentName} -Dlog4j.configuration=file:/opt/flume/conf/log4j.properties
fi



    

# 로그 출력
tail -f /opt/flume/logs/flume.log
