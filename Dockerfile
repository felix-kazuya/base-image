FROM ubuntu:16.04
MAINTAINER Felix Kazuya <me@felixkazuya.de>
MAINTAINER Christian Walonka <cwalonka@it-economics.de>
ENV REFRESHED_AT 2019-03-04

#Installing Required Stuff
RUN locale-gen de_DE && \
    locale-gen de_DE.UTF-8 && \
    update-locale && \
    apt-get -y update && \
    apt-get install -y python3 python3-yaml python3-jinja2 python3-httplib2 python3-paramiko python3-setuptools python3-pkg-resources git python3-pip htop tree nano wget curl software-properties-common && \
    apt-get -y upgrade && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove 
RUN pip3 install --upgrade pip && pip install python3-keyczar && ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN pip3 install ansible

#Setting up required Environment 
ENV TERM xterm

#Date of Build
RUN echo "Built at" $(date) > /etc/built_at

#Startconfig
CMD [ "cat", "/etc/built_at" ]
