FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm git
#Grab app code
RUN git clone https://github.com/ostercloud/node-hello.git /src

# Bundle app source
COPY ./src /src
# Install app dependencies
RUN cd /src; npm install
#install newrelic
RUN npm install newrelic

#install loadtesting stuff
RUN npm install loadtest

EXPOSE  8080
CMD node /src/index.js
