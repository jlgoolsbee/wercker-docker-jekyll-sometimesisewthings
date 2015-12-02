FROM ruby:2.2.3
MAINTAINER Lee Goolsbee "jlgoolsbee@gmail.com"

# Update packages
RUN apt-get update -y && apt-get upgrade -y

# Install some additional packages we need for Jekyll and the AWS CLI
RUN apt-get install -y build-essential python-dev locales

# Set system language and locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen

# Set some environment variables
ENV LC_ALL=en_US.utf8
ENV LANGUAGE=en_US.utf8
ENV LC_CTYPE=en_US.UTF-8

# Install latest version of pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install AWS CLI
RUN pip install awscli

# Install Node.JS
RUN cd /usr/local && curl http://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz | tar --strip-components=1 -zxf- && cd
RUN npm -g update npm

# Drop into a bash shelld
CMD ["/bin/bash"]
