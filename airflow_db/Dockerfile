FROM mariadb

LABEL maintainer="Jiyoung Choi <cjy@imrbiz.co.kr>"

COPY timestamp.sh /
RUN chmod +x /timestamp.sh
RUN mv /timestamp.sh /docker-entrypoint-initdb.d/


EXPOSE 3306