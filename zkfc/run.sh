#!/bin/bash

hdfs --daemon start zkfc

# 자동으로 종료되지 않도록 방지.
tail -f /dev/null




