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
&& mkdir -p $FLUME_HOME/logs \ 
&& touch $FLUME_HOME/logs/flume.log \
&& chmod 755 $FLUME_HOME/logs/flume.log \
# ./logs 경로를 => /opt/flume/logs로 변경
&& sed -i 's/\.\/logs/\/opt\/flume\/logs/g' $FLUME_HOME/conf/log4j.properties


COPY config/OneM2M-Agent-conf.properties $FLUME_HOME/conf
COPY config/OneM2M-Kafka-Agent-conf.properties $FLUME_HOME/conf
COPY config/test.conf $FLUME_HOME/conf
COPY config/init.sh /init.sh

RUN chmod a+x /init.sh

# Shell execute
CMD ["/init.sh"]




