FROM makengi12/spark-master:1.1

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

ENV SPARK_HOME /spark
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8085
ENV SPARK_MASTER_LOG /spark/logs

COPY hive-site.xml /spark/conf/

RUN mkdir -p $SPARK_HOME/util-jars \
&& mkdir -p /spark/event_log_dir \
&& mkdir -p /spark/event_fs_log_dir \ 
&& mkdir -p /jars


COPY ./jars/commons-lang-2.6.jar $SPARK_HOME/util-jars
COPY ./jars/postgresql-42.2.19.jre6.jar $SPARK_HOME/util-jars
COPY /config/spark-default.conf /spark/conf/
COPY /testfiles/spark-yarn--drivers.jar /jars/

EXPOSE 8085 7077 6066

CMD ["/bin/bash", "/master.sh"]
