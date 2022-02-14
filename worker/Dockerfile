# FROM bde2020/spark-base:3.0.0-hadoop3.2
FROM makengi12/spark-worker:1.0

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

RUN mkdir -p /spark/event_log_dir \
&& mkdir -p /spark/event_fs_log_dir \
&& mkdir -p /jars

# hive 설정 파일 복사 
COPY hive-site.xml /spark/conf/
COPY /config/spark-default.conf /spark/conf/
COPY /testfiles/spark-yarn--drivers.jar /jars/


CMD ["/bin/bash", "/worker.sh"]
