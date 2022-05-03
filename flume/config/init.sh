#!/bin/bash

echo $configFile
echo $agentName
echo $avroHost
echo $spoolDir

equal_str="="

if [ -z $spoolDir ]
then
    echo "Ooop Config Directory Is Null Value.."
else
    echo "Set SpoolDirectory Path"
    echo $agentName
    result_str=`sed -n "/${agentName}.sources.AvroSource.spoolDir/p" /opt/flume/conf/$configFile`
    echo "result_str: ${result_str}"
    split_str=(`echo $result_str | tr "=" ' '`)
    echo ${split_str[1]}
    # 대체할 경로 
    replace_path=${split_str[0]}$equal_str$spoolDir
    echo "replace path: ${replace_path}"
    sed -i "s~${result_str}~${replace_path}~g" /opt/flume/conf/$configFile
    #sed -i 's/${result_str}/${replace_path}/g' /opt/flume/conf/$configFile
fi

if [ -n $avroHost ]
then
    result_str=`sed -n "/${agentName}.sinks.AvroSink.hostname/p" /opt/flume/conf/$configFile`
    split_str=(`echo $result_str | tr "=" ' '`)
    echo ${split_str[1]}

    # 대체할 아이피
    replace_hostname=${split_str[0]}$equal_str$avroHost
    echo "replace hostname: ${replace_hostname}"
    sed -i "s~${result_str}~${replace_hostname}~g" /opt/flume/conf/$configFile
fi    


if [ -z $configFile ]
then
    echo "Empty Config File"
else
    echo "# Not Empty Config File"
    bash /opt/flume/bin/flume-ng agent -Xms1000m -Xmx2000m --conf conf --conf-file /opt/flume/conf/${configFile} --name ${agentName} -Dlog4j.configuration=file:/opt/flume/conf/log4j.properties
fi



    

# 로그 출력
tail -f /opt/flume/logs/flume.log
