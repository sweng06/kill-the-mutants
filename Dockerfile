FROM opentable/baseimage-java8

# install git
RUN apt-get update && apt-get install -y git

# install supervisor
RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup buildtime arguments and runtime variables
#ARG USERNAME
#ARG TESTNAME
#ARG TIMESTAMP
ENV USERNAME "kill-the-mutants"
ENV TESTNAME "example1"
ENV TIMESTAMP "0000000000"

# copy user's repo
RUN git clone https://github.com/${USERNAME}/kill-the-mutants
WORKDIR /kill-the-mutants

# setup for a given test suite
RUN mv ${TESTNAME}/${TIMESTAMP}/* ${TESTNAME}/

# compile
ENV DEPENDENCIES_DIR dependencies
ENV CLASSPATH ${DEPENDENCIES_DIR}/*
RUN javac -cp "${CLASSPATH}" ${TESTNAME}/*.java
ENV CLASSPATH=${CLASSPATH}:.

#CMD ["sh", "-c", "echo ${MY_HOME}"]

# run mutation testing
#CMD ["/sbin/my_init","java","-cp","{","sh","-c","echo ${CLASSPATH}","}","org.pitest.mutationtest.commandline.MutationCoverageReport","--reportDir","./reports","--sourceDirs",".","--targetClasses","{","sh","-c","echo ${TESTNAME}.Snippet","}","--targetTests","{","sh","-c","echo ${TESTNAME}.TestSuite","}"]

# run mutation testing
#CMD /sbin/my_init && java -cp $CLASSPATH \
#             org.pitest.mutationtest.commandline.MutationCoverageReport \
#              --reportDir ./reports \
#              --sourceDirs . \
#              --targetClasses $TESTNAME.Snippet \
#              --targetTests $TESTNAME.TestSuite

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
