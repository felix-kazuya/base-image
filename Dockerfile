ARG	IMAGE=ubuntu
ARG	TAG=16.04
FROM $IMAGE:$TAG
MAINTAINER Felix Kazuya <me@felixkazuya.de>
MAINTAINER Christian Walonka <cwalonka@it-economics.de>
ENV REFRESHED_AT 2019-03-04

#Installing Required Stuff
RUN apt-get -y update && \
    apt-get install -y locales python3 python3-yaml python3-jinja2 \
    python3-httplib2 python3-paramiko python3-setuptools python3-pkg-resources \
    python3-pip htop tree nano wget curl software-properties-common libcurl4-gnutls-dev \
    libexpat1-dev gettext libz-dev libssl-dev build-essential autoconf \
    && wget https://www.kernel.org/pub/software/scm/git/git-2.20.1.tar.gz -O git.tar.gz && \
    tar -xzf git.tar.gz && cd git-2.20.1 && \
    make configure && ./configure --prefix=/usr/local && make install && \
    apt-get -y upgrade && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove 
RUN pip3 install --upgrade pip && pip install python3-keyczar && ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN pip3 install ansible

RUN locale-gen de_DE && \
    locale-gen de_DE.UTF-8 && \
    update-locale

#Setting up required Environment 
ENV TERM xterm

#Date of Build
RUN echo "Built at" $(date) > /etc/built_at

#Startconfig
CMD [ "cat", "/etc/built_at" ]
