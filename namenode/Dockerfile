FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

# sqoop setting
USER root

ENV SQOOP_HOME /usr/local/sqoop
RUN apt-get update && apt-get install -y wget && apt-get install -y vim


RUN wget http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
RUN tar -xvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -C  /usr/local
RUN ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME

# Download the JDBC drivers for Postgresql

COPY ./jars/commons-lang-2.6.jar $SQOOP_HOME/lib
COPY ./jars/postgresql-42.2.19.jre6.jar $SQOOP_HOME/lib


# RUN wget -P $SQOOP_HOME/lib https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar

# Download the JDBC drivers for mysql
RUN wget -P /tmp/ http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.tar.gz && \
    tar -C /tmp/ -xzf /tmp/mysql-connector-java-5.1.37.tar.gz && \
    cp /tmp/mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar $SQOOP_HOME/lib

ENV PATH $PATH:$SQOOP_HOME/bin

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]
