FROM java:8

# setup buildtime arguments and runtime variables
ARG USERNAME
ARG TESTNAME
ARG TIMESTAMP
ENV USERNAME $USERNAME
ENV TESTNAME $TESTNAME
ENV TIMESTAMP $TIMESTAMP

# copy user's repo
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/${USERNAME}/kill-the-mutants
WORKDIR /kill-the-mutants

# setup for a given test suite
RUN mv ${TESTNAME}/${TIMESTAMP}/* ${TESTNAME}/

# compile
ENV DEPENDENCIES_DIR dependencies
ENV CLASSPATH ${DEPENDENCIES_DIR}/*
RUN javac -cp "${CLASSPATH}" ${TESTNAME}/*.java
ENV CLASSPATH=${CLASSPATH}:.

# make sure it doesn't fail tests
# TODO

# run mutation testing
CMD java -cp ${CLASSPATH} \
            org.pitest.mutationtest.commandline.MutationCoverageReport \
            --reportDir ./reports \
            --sourceDirs . \
            --targetClasses ${TESTNAME}.Snippet \
            --targetTests ${TESTNAME}.TestSuite
