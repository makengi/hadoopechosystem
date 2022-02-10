FROM openjdk:8

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive
# ENV JAVA_HOME=/usr/lib/jvm-java-8-openjdk-amd64

RUN apt-get install -y wget \
&& apt-get install -y vim \
&& apt-get install -y procps \ 
&& apt-get install -y net-tools \
&& wget downloads.apache.org/zookeeper/zookeeper-3.7.0/apache-zookeeper-3.7.0-bin.tar.gz \ 
&& tar -zxvf apache-zookeeper-3.7.0-bin.tar.gz \
&& mv apache-zookeeper-3.7.0-bin /opt/zookeeper

# 설정파일 local -> container
COPY config/zoo.cfg /opt/zookeeper/conf/zoo.cfg
COPY config/init.sh init.sh 

RUN sed -i 's/\r//g' init.sh
RUN sed -i 's/\r//g' /opt/zookeeper/conf/zoo.cfg


CMD bash init.sh 


