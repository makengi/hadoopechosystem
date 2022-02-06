FROM makengi12/airflow:1.3

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
RUN apt-get update && apt-get install -y openjdk-8-jdk && apt-get clean
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

