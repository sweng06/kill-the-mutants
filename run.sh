#!/bin/sh

# default to JUnit
case ${TEST_TOOL?junit} in

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
