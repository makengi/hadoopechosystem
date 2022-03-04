#!/bin/sh

ETC_HOSTS=/etc/hosts

HOSTNAME="datanode\tnamenode\tresourcemanager\tnodemanager\thistoryserver"

IP=$HADOOP_IP

HOSTS_LINE="$IP\t$HOSTNAME"

target="datanode"

str="$(grep $target /etc/hosts)"

echo $str

if [ -n "$(grep $target /etc/hosts)" ]; then
        echo "$HOSTNAME already exists : $(grep $HOSTNAME $ETC_HOSTS)"
else
        echo "Adding $HOSTNAME to your $ETC_HOSTS";
        sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";
fi                                                        