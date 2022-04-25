#!/bin/bash

echo "parameter is ${SCHEDULER}";

if [ -z "$SCHEDULER" ];
then
    echo "###### Start Webserver #####";
    airflow webserver
else
    echo "##### Start Scheduler Server #####";
    airflow scheduler     
fi
#airflow webserver

#tail -f /dev/null