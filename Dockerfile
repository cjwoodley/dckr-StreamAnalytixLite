FROM ubuntu:18.04


# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#install curl 
RUN apt-get install -y curl

# Create app directory
WORKDIR /opt/sax_lite

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY StreamAnalytix-3.1.0-SNAPSHOT.tar.gz ./

RUN tar -xvf StreamAnalytix-3.1.0-SNAPSHOT.tar.gz 
# If you are building your code for production
# RUN npm install --only=production


EXPOSE 8090
#CMD [ "/opt/sax_lite/StreamAnalytix/bin/startServicesServer.sh" ]
CMD ["/bin/bash"]