#!/bin/sh

#USERNAME=$1
#TESTNAME=$2
#TIMESTAMP=$3
#TEST_TOOL=$4

#USERNAME=$USERNAME
#TESTNAME=$TESTNAME
#TIMESTAMP=$TIMESTAMP
#TEST_TOOL=$TEST_TOOL

USERNAME="kill-the-mutants"
TESTNAME="example1"
TIMESTAMP="0000000000"
TEST_TOOL="junit"

# must run command with all options
#if [[ $# -ne 4 ]]; then
#  echo "Usage: USERNAME TESTNAME TIMESTAMP TEST_TOOL"
#  exit 0
#fi

## remove user's repo if leftover from previous run
#if [ -d kill-the-mutants ]; then
#  rm -rf kill-the-mutants
#fi

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

java -cp $CLASSPATH \
              org.pitest.mutationtest.commandline.MutationCoverageReport \
              --reportDir ./reports \
              --sourceDirs . \
              --targetClasses $TESTNAME.Snippet \
              --targetTests $TESTNAME.TestSuite

echo 'hello'

# default to JUnit
#case "${TEST_TOOL?junit}" in
#
#  # vanilla JUnit
#  junit)  exec java -cp $CLASSPATH $TESTNAME.TestSuite
#          ;;
#
#  # PIT mutation testing
#  pit)    exec java -cp $CLASSPATH \
#              org.pitest.mutationtest.commandline.MutationCoverageReport \
#              --reportDir ./reports \
#              --sourceDirs . \
#              --targetClasses $TESTNAME.Snippet \
#              --targetTests $TESTNAME.TestSuite
#          ;;
#
#  # Jumble mutation testing
#  jumble) exec java -jar $DEPENDENCIES_DIR/jumble_binary_1.3.0.jar \
#              --classpath $CLASSPATH \
#              $TESTNAME.Snippet \
#              $TESTNAME.Tests
#          ;;
#
#esac

# clean up
#cd ..
#rm -rf kill-the-mutants
#exit 0
