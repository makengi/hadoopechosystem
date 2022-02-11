FROM makengi12/spark-master:1.0

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8085
ENV SPARK_MASTER_LOG /spark/logs

COPY hive-site.xml /spark/conf/

RUN mkdir -p $SPARK_HOME/util-jars

COPY ./jars/commons-lang-2.6.jar $SPARK_HOME/util-jars
COPY ./jars/postgresql-42.2.19.jre6.jar $SPARK_HOME/util-jars

EXPOSE 8085 7077 6066

CMD ["/bin/bash", "/master.sh"]
