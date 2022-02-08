FROM makengi12/airflow:1.4

LABEL maintainer="Jiyoung Choi <cjy@imrbiz.co.kr>"

#init airflow 
# WORKDIR /root

#default shell
# SHELL ["/bin/bash", "-c"]
USER root

# RUN echo "source /root/airflow-venv/bin/activate" >> .bashrc
# RUN . ~/.bashrc
COPY run.sh /
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openjdk-8-jdk \
 && apt-get clean \
 && apt-get install -y wget

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_VERSION=2.7.4
ENV HADOOP_PREFIX=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
ENV PATH=/opt/hadoop/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV HIVE_HOME=/opt/hive
ENV PATH=/opt/hive/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV USER=root
ENV SPARK_HOME=/opt/spark
ENV PATH=/opt/spark/bin/:/opt/hive/bin:/:/opt/hadoop/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV SQOOP_HOME /opt/sqoop

# sqoop install 
RUN wget http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz \
    && tar -xvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -C  /opt/ \
    && mv /opt/sqoop-1.4.7.bin__hadoop-2.6.0 /opt/sqoop \ 
    && wget -P /tmp/ http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.tar.gz \
    && tar -C /tmp/ -xzf /tmp/mysql-connector-java-5.1.37.tar.gz \
    && rm /tmp/mysql-connector-java-5.1.37.tar.gz \
    && cp /tmp/mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar $SQOOP_HOME/lib

COPY ./jars/commons-lang-2.6.jar $SQOOP_HOME/lib
COPY ./jars/postgresql-42.2.19.jre6.jar $SQOOP_HOME/lib

ENV PATH $PATH:$SQOOP_HOME/bin


RUN chmod a+x /run.sh && rm -rf /root/airflow/airflow.cfg

# COPY airflow.cfg /root/airflow/
# RUN echo `airflow users create --username airflow --firstname jiyoung --lastname choi --role Admin --password airflow --email cjy@imrbiz.co.kr
#set Volume
VOLUME /root/airflow/

#move shell script to ~/run.sh
# ADD run.sh /root/run.sh

#external port 
EXPOSE 8085

# RUN /run.sh

