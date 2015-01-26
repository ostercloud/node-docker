FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm

# Bundle app source
COPY ./src /src
# Install app dependencies
RUN cd /src; npm install
#install newrelic
RUN npm install newrelic

#install loadtesting stuff
RUN npm install loadtest

EXPOSE  8080
CMD node /src/index.js; sleep 60; loadtest -c 10 -k -t 30 --rps 200 http://localhost:8080/
