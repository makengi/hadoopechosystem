FROM makengi12/spark-base:1.0

LABEL maintainer="Choi ji young <cjy@imrbiz.co.kr>"

COPY master.sh /

ENV SPARK_HOME /spark
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8085
ENV SPARK_MASTER_LOG /spark/logs
ENV ZIP_FILE_NAME=apache-livy-0.7.1-incubating-bin.zip
ENV FILE_NAME=apache-livy-0.7.1-incubating-bin

COPY hive-site.xml /spark/conf/

RUN mkdir -p $SPARK_HOME/util-jars \
&& mkdir -p /spark/event_log_dir \
&& mkdir -p /spark/event_fs_log_dir \ 
&& mkdir -p /jars \
&& apt-get install -y unzip \
&& wget https://dlcdn.apache.org/incubator/livy/0.7.1-incubating/$ZIP_FILE_NAME -P /opt/ \
&& unzip /opt/$ZIP_FILE_NAME \
&& mv /${FILE_NAME} /opt/livy \
&& rm /opt/${ZIP_FILE_NAME} \
&& mkdir -p /opt/livy/logs

# && mkdir -p /opt/livy/logs


COPY ./jars/commons-lang-2.6.jar $SPARK_HOME/util-jars
COPY ./jars/postgresql-42.2.19.jre6.jar $SPARK_HOME/util-jars
COPY /config/spark-default.conf /spark/conf/
COPY /testfiles/spark-yarn--drivers.jar /jars/

EXPOSE 8085 7077 6066

CMD ["/bin/bash", "/master.sh"]
