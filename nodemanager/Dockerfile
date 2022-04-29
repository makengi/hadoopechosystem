FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

## Python 3.8 추가 
RUN apt-get update \ 
&& apt-get install -y build-essential checkinstall \
&& apt-get install -y wget \ 
&& apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
&& wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz \
&& tar xzf Python-3.8.12.tgz && cd Python-3.8.12 \ 
&& ./configure --enable-optimizations \
&& make -j 4 \
&& make altinstall 

RUN update-alternatives --install /usr/bin/python3 python3 /Python-3.8.12/python 1
# RUN echo 'alias python3=/usr/local/bin/python3.8' >> ~/.bashrc



EXPOSE 8042

CMD ["/run.sh"]
