FROM java:8

RUN apt-get update && apt-get install -y \
    git

// copy user's repo
git clone https://github.com/${USER}/kill-the-mutants
WORKDIR /kill-the-mutants

// setup for a given test suite
RUN mv /${TESTNAME}/${TIMESTAMP}/* /{$TESTNAME}

// compile
ENV DEPENDENCIES_DIR /../dependencies
ENV CLASSPATH ${DEPENDENCIES_DIR}/*
RUN javac -cp "${CLASSPATH}" {$TESTNAME}/*.java

// make sure it doesn't fail tests
// TODO

// run mutation testing
CMD java -cp ${CLASSPATH} \
            org.pitest.mutationtest.commandline.MutationCoverageReport \
            --reportDir ./reports \
            --sourceDirs . \
            --targetClasses {$TESTNAME}.Snippet \
            --targetTests {$TESTNAME}.TestSuite
        ;;
