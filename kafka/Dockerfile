FROM openjdk:8

COPY config/init.sh init.sh
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
&& apt-get install wget -y \
&& apt-get install vim -y \
&& wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.12-3.1.0.tgz \
&& tar -zxvf kafka_2.12-3.1.0.tgz \ 
&& mv kafka_2.12-3.1.0 /opt/kafka \
&& mkdir /data \
&& chmod +x /init.sh

COPY config/server.properties /opt/kafka/config/server.properties

# 공백 제거 
RUN sed -i 's/\r//g' init.sh
RUN sed -i 's/\r//g' /opt/kafka/config/server.properties

CMD bash init.sh



