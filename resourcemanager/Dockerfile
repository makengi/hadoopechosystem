FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

COPY config/core-site.xml /opt/hadoop-3.2.1/etc/hadoop/
COPY config/hdfs-site.xml /opt/hadoop-3.2.1/etc/hadoop/
COPY config/yarn-site.xml /opt/hadoop-3.2.1/etc/hadoop/
COPY config/mapred-site.xml /opt/hadoop-3.2.1/etc/hadoop/

EXPOSE 8088

CMD ["/run.sh"]
