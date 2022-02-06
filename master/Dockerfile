FROM bde2020/spark-base:3.0.0-hadoop3.2

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8085
ENV SPARK_MASTER_LOG /spark/logs

COPY hive-site.xml /spark/conf/

EXPOSE 8085 7077 6066

CMD ["/bin/bash", "/master.sh"]
