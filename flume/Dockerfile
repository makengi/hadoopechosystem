FROM openjdk:8

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive
ENV FLUME_HOME=/opt/flume

RUN apt-get install -y wget \
&& apt-get install -y vim \
&& apt-get install -y procps \ 
&& apt-get install -y net-tools \
&& wget https://dlcdn.apache.org/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz \ 
&& tar -zxvf apache-flume-1.9.0-bin.tar.gz \
&& mv  apache-flume-1.9.0-bin $FLUME_HOME \
&& mv $FLUME_HOME/conf/flume-env.sh.template $FLUME_HOME/conf/flume-env.sh \ 
&& echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> $FLUME_HOME/conf/flume-env.sh \ 
&& echo "JAVA_OPTS=-Xms100m -Xmx2000m -Dcom.sun.management.jmxremote" >> $FLUME_HOME/conf/flume-env.sh \ 
&& echo "FLUME_CLASSPATH=/opt/flume/lib/hadoop-common-3.2.1.jar" \
&& mkdir -p $FLUME_HOME/logs \ 
&& touch $FLUME_HOME/logs/flume.log \
&& chmod 755 $FLUME_HOME/logs/flume.log \
# ./logs 경로를 => /opt/flume/logs로 변경
&& sed -i 's/\.\/logs/\/opt\/flume\/logs/g' $FLUME_HOME/conf/log4j.properties \ 
# guava 구버전 <= 하둡3버전과 호환 되지 않음
&& mv /opt/flume/lib/guava-11.0.2.jar /opt/flume/lib/guava-11.0.2.jar.bak


COPY config/OneM2M-Agent-conf.properties $FLUME_HOME/conf
# Hdfs Sink 의존성 라이브러리 추가
COPY lib/hadoop-common-3.2.1.jar /opt/flume/lib
COPY lib/woodstox-core-5.0.3.jar /opt/flume/lib
COPY lib/guava-27.0-jre.jar /opt/flume/lib
COPY lib/hadoop-auth-3.2.1.jar /opt/flume/lib
COPY lib/hadoop-hdfs-client-3.2.1.jar /opt/flume/lib
COPY lib/htrace-core4-4.1.0-incubating.jar /opt/flume/lib
COPY lib/stax2-api-3.1.4.jar /opt/flume/lib
COPY lib/commons-configuration2-2.1.1.jar /opt/flume/lib
COPY lib/commons-lang3-3.12.0.jar /opt/flume/lib

COPY config/OneM2M-Avro-Hdfs.conf $FLUME_HOME/conf
COPY config/OneM2M-Avro.conf $FLUME_HOME/conf
COPY config/OneM2M-Kafka-Agent-conf.properties $FLUME_HOME/conf
COPY config/test.conf $FLUME_HOME/conf
COPY config/init.sh /init.sh

RUN chmod a+x /init.sh

# Shell execute
CMD ["/init.sh"]




