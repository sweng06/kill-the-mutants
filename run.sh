#!/bin/sh

USERNAME=${1:-$USERNAME}
TESTNAME=${2:-$TESTNAME}
TIMESTAMP=${3:-$TIMESTAMP}
TEST_TOOL=${4:-$TEST_TOOL}

# check required parameters
if [ -z ${USERNAME+x} ] ||
   [ -z ${TESTNAME+x} ] ||
   [ -z ${TIMESTAMP+x} ]; then
  echo "Usage: USERNAME TESTNAME TIMESTAMP TEST_TOOL"
  exit 0
fi

# set test tool to default if not set
if [ -z "$TEST_TOOL" ]; then
  TEST_TOOL="junit"
fi

# copy user's repo
git clone https://github.com/${USERNAME}/kill-the-mutants
cd kill-the-mutants

# setup for a given test suite
mv ${TESTNAME}/${TIMESTAMP}/* ${TESTNAME}/

# compile
DEPENDENCIES_DIR=dependencies
CLASSPATH=${DEPENDENCIES_DIR}/*
javac -cp "${CLASSPATH}" ${TESTNAME}/*.java
CLASSPATH=${CLASSPATH}:.

# default to JUnit
case "${TEST_TOOL?junit}" in

  # vanilla JUnit
  junit)  java -cp $CLASSPATH $TESTNAME.TestSuite
          ;;

  # PIT mutation testing
  pit)    java -cp $CLASSPATH \
              org.pitest.mutationtest.commandline.MutationCoverageReport \
              --reportDir ./reports \
              --sourceDirs . \
              --targetClasses $TESTNAME.Snippet \
              --targetTests $TESTNAME.TestSuite
          ;;

  # Jumble mutation testing
  jumble) java -jar $DEPENDENCIES_DIR/jumble_binary_1.3.0.jar \
              --classpath $CLASSPATH \
              $TESTNAME.Snippet \
              $TESTNAME.Tests
          ;;

esac
