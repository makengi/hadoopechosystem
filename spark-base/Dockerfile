FROM makengi12/hadoop-base:1.0

# Hadoop 베이스 이미지에 스파크 설치 

LABEL maintainer="Choi ji young <cjy@imrbiz.co.kr>"

ENV ENABLE_INIT_DAEMON false
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV BASE_URL=https://archive.apache.org/dist/spark/
ENV SPARK_VERSION=3.0.0
ENV HADOOP_VERSION=3.2

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /
COPY add-hostname.sh /

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

RUN chmod +x *.sh \
      && apt-get update \
      && apt-get install -y wget \
      && wget ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
      && cd /

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh && chmod +x /add-hostname.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1