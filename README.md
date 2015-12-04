# kill-the-mutants

[Kill the Mutants](TODO) is an educational tool that teaches developers how to write better fault-detecting test suites. As you progress through Kill the Mutants, your progress is saved to this repository.

## Structure

Our goal is to make each example simple to follow. Each example has its own folder with the following files:

##### Snippet.java
This file is a small class (or 'snippet') that contains the code to be tested.

##### TestSuite.java
This file is how you run your tests. It should be the same in every example folder.

If you have written a test suite for an example, you will also see any number of subfolders with timestamp names. Each of these have the following file:

##### Tests.java
This file contains your test suite!

```
kill-the-mutants
│   README.md
│   Dockerfile
│
├───example1
│   │   Snippet.java
│   │   TestSuite.java
│   │
│   ├───1448543420
│   │   │   Tests.java
│   │
│   ├───1448836027
│   │   │   Tests.java
│   │
│   │ ...
│
│ ...
│
└───dependencies
    │   junit-4.12.jar
    │   hamcrest-core-1.3.jar
    │   pitest-1.1.7.jar
    │   pitest-command-line-1.1.7.jar
    │   jumble_binary_1.3.0.jar

```

## Running a Test Suite

To run any of your test suites, you need to install Docker to your machine. Follow instructions to install Docker [here](https://docs.docker.com/installation/).

*Mac and Windows Users:*  
If you are using Mac OS X or Windows, make sure to run the Docker Quickstart Terminal.

All that's left is to build and run your container. Make sure you define the following build arguments and environment variables:

```
Build Arguments

USERNAME    Your Github username
TESTNAME    The example name you would like to run
TIMESTAMP   The timestamp of the test suite you want to run

Example usage:
$ docker build --build-arg ENV=development .

Environment Variables

TEST_TOOL   The command you want to execute on your code
  junit   :  Vanilla JUnit testing (default)
  pit     :  PIT mutation testing tool
  jumble  :  Jumble mutation testing tool

Example usage:
$ docker run --env ENV=development
```

Here are some common commands to help you along:

```
// Build your current directory into an image
$ docker build --build-arg USERNAME=kill-the-mutants --build-arg TESTNAME=example1 --build-arg TIMESTAMP=0000000000 --tag=kill-the-mutants .

// Run a new docker container using an image
$ docker run --name=kill-the-mutants --env TEST_TOOL=pit kill-the-mutants

// Run an existing docker container
$ docker run --env TEST_TOOL=pit kill-the-mutants

// Run an existing docker container and then open it (~ ssh)
$ run -t -i kill-the-mutants /bin/sh

// List all containers
$ docker ps

// Stop a running container
$ docker stop kill-the-mutants

// Remove a container
$ docker rm kill-the-mutants
```

More commands can be found [here!](https://github.com/wsargent/docker-cheat-sheet).
