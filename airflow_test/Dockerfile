FROM ubuntu:20.04

LABEL maintainer="Jiyoung Choi <cjy@imrbiz.co.kr>"


USER root

RUN  apt-get update && apt-get install -y python3-pip && pip install apache-airflow && airflow db init \
 && airflow users create --username airflow --firstname jiyoung --lastname choi --role Admin --password airflow --email cjy@imrbiz.co.kr

COPY requirements.txt /

RUN pip3 install -r requirements.txt

ENV PYSPARK_PYTHON=python3

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openjdk-8-jdk \
 && apt-get clean \
 && apt-get install -y wget

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV BASE_URL=https://archive.apache.org/dist/spark/
ENV SPARK_VERSION=3.0.0
ENV HADOOP_VERSION=3.2
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
ENV YARN_CONF_DIR=/opt/hadoop/etc/hadoop
ENV HADOOP_HOME=/opt/hadoop

## Install Hive Client
ENV HIVE_VERSION=2.3.9

## make Hadoop Conf dir

RUN apt-get update && apt-get install -y && wget https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
&& tar -xvzf apache-hive-${HIVE_VERSION}-bin.tar.gz -C /opt/ \
&& mv /opt/apache-hive-2.3.9-bin /opt/hive \ 
&& rm apache-hive-${HIVE_VERSION}-bin.tar.gz

## Install Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.2.3/hadoop-3.2.3.tar.gz \ 
&& tar -xvf hadoop-3.2.3.tar.gz -C /opt/ \
&& mv /opt/hadoop-3.2.3 /opt/hadoop \
&& rm hadoop-3.2.3.tar.gz 

COPY hadoop_conf/ /opt/hadoop/etc/hadoop

## Install Spark
RUN  wget ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt/ \
      && mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && cp /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh \
      && echo "HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop" >> /opt/spark/conf/spark-env.sh \ 
      && echo "YARN_CONF_DIR=/opt/hadoop/etc/hadoop" >> /opt/spark/conf/spark-env.sh \
      && echo "PYSPARK_PYTHON=python3" >> /opt/spark/conf/spark-env.sh


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
    && cp /tmp/mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar $SQOOP_HOME/lib \
    # 타임존 한국시간으로 변경
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 



COPY ./jars/commons-lang-2.6.jar $SQOOP_HOME/lib
COPY ./jars/postgresql-42.2.19.jre6.jar $SQOOP_HOME/lib

ENV PATH $PATH:$SQOOP_HOME/bin


RUN rm -rf /root/airflow/airflow.cfg && mkdir -p /root/airflow/dags

COPY airflow.cfg /root/airflow/

EXPOSE 8086

COPY run.sh / 
RUN chmod +x /run.sh

CMD ["/run.sh"]


