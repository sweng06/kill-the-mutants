FROM java:8

# install git
RUN apt-get update && apt-get install -y git

# copy over script
COPY run.sh .

CMD ./run.sh
