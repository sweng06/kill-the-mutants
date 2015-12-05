FROM opentable/baseimage-java8

# install git
RUN apt-get update && apt-get install -y git

# install tini
ENV TINI_VERSION v0.8.4
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# clean container
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy over script
COPY run.sh .

CMD ./run.sh
