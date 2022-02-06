#!/usr/bin/env bash

# airflow db init

# airflow users create -r Admin -u admin -e admin@example.com -f admin -l user -p admin
python3 /root/airflow-venv/bin/airflow webserver
exec $@