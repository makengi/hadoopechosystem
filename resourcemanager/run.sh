#!/bin/bash


if [ -z "$IS_DAEMON" ]; then
    echo "is not Daemon mode"
    $HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager
else
    echo "is running daemon mode"
    $HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start resourcemanager
    # 자동으로 종료되지 않도록 방지한다. 
    tail -f /dev/null
fi    
# $HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager