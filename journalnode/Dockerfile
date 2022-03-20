FROM makengi12/hadoop-base:1.0

RUN mkdir -p /hadoop-cluster

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
