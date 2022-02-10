#!/bin/bash


sed -i "s/{{broker_id}}/$BROKER_ID/" /opt/kafka/config/server.properties
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties



