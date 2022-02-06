FROM openjdk:8

LABEL maintainer="Choi Ji Young <cjy@imrbiz.co.kr>"

ENV HBASE_VERSION=2.4.9
ENV HBASE_URL http://

RUN DEBIAN_FRONTEND=noninteractive

# etc utility
RUN apt-get update \
&& apt-get install -y --no-install-recommends net-tools curl netcat vim procps iputils-ping wget


#HBase install 
RUN wget https://dlcdn.apache.org/hbase/2.4.9/hbase-${HBASE_VERSION}-bin.tar.gz \
    && tar -xvf hbase-${HBASE_VERSION}-bin.tar.gz \
    && mv hbase-${HBASE_VERSION} hbase \
    && rm hbase-${HBASE_VERSION}-bin.tar.gz

    
ENV HBASE_HOME /hbase
ENV PATH /hbase/bin:$PATH

COPY hbase-site.xml $HBASE_HOME/conf/







