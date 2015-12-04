FROM opentable/baseimage-java8

# install git
RUN apt-get update && apt-get install -y git

COPY run.sh .

# run mutation testing
CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
