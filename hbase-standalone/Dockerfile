FROM makengi12/hbase-base:1.0

RUN mkdir -p /zookeeper-data
COPY run.sh  /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]