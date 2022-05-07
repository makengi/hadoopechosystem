#!/bin/bash

start-hbase.sh
tail -f /hbase/logs/*
tail -f /dev/null