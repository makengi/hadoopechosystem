#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

echo "remove lost+found from $namedir"
rm -r $namedir/lost+found


$HADOOP_HOME/bin/hdfs namenode -bootstrapStandby -force -skipSharedEditsCheck

# $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
$HADOOP_HOME/bin/hdfs --daemon start namenode
$HADOOP_HOME/bin/hdfs --daemon start zkfc

# 자동으로 종료되지 않도록 방지한다. 
tail -f /dev/null


