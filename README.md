# kill-the-mutants

## Installation in Docker

To run any of your test suites, you need to install Docker to your machine. Follow instructions to install Docker [here](https://docs.docker.com/installation/).

*Mac and Windows Users:*  
If you are using Mac OS X or Windows, make sure to run the Docker Quickstart Terminal.

All that's left is to build and run your container. Here are some common commands to help you along:

```
// Build your current directory into an image
docker build --build-arg USERNAME=kill-the-mutants --build-arg TESTNAME=example1 --build-arg TIMESTAMP=1448836027 --tag=kill-the-mutants .

// Run a new docker container using an image
docker run --name=kill-the-mutants kill-the-mutants

// Run a an existing docker container
docker run kill-the-mutants -a

// List all containers
docker ps

// Kill a running container
docker stop apigoteway

// Remove a container
docker rm apigoteway
```
