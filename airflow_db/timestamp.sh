#!/bin/bash

## MYSQL TimeStamp 값 변경
TIMESTAMP_OFF="explicit_defaults_for_timestamp=0"

TIMESTAMP_ON="explicit_defaults_for_timestamp=1"

cat /etc/mysql/mariadb.cnf | while read line
do
   if [ "$line" == "$TIMESTAMP_ON" ]
   then
        echo "already set timestamp ON"
        break
   fi

   if [ "$line" == "$TIMESTAMP_OFF" ]
   then
        echo "change TimeStamp_OFF to TimeStamp On"
        sed -i "s/${TIMESTAMP_OFF}/${TIMESTAMP_ON}/g" /etc/mysql/mariadb.cnf
        break;
   fi
done


cat_result=`cat /etc/mysql/mariadb.cnf | grep "timestamp"`

if [ -z $cat_result ]
then
   echo $TIMESTAMP_ON >> /etc/mysql/mariadb.cnf
fi

