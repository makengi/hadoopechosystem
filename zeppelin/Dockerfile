FROM apache/zeppelin:0.10.0

LABEL maintainer="Choi Ji Young <cjy@imrbiz.co.kr>"

# 기본 주소 
ENV BASE_URL=https://archive.apache.org/dist/spark/

# 스파크 하둡 버전 설정
ENV SPARK_VERSION=3.2.0
ENV HADOOP_VERSION=3.2

# 스파크 기본 설정
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8085
ENV SPARK_MASTER_LOG /spark/logs

USER root


# 스파크 설치 작업 
RUN cd / && apt-get update \
      && apt-get install -y procps \
      # && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      # && chmod +x *.sh \
      && wget ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && cd /zeppelin
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \

# 스파크에서 HIVE 사용 위한 설정 파일doc
COPY hive-site.xml /spark/conf/




      