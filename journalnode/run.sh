#!/bin/bash

hdfs --config $HADOOP_CONF_DIR --daemon start journalnode

# 자동으로 종료되지 않도록 방지.
tail -f /dev/null




