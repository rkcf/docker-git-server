FROM ubuntu:14.04
MAINTAINER zoombafu

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y git openssh-server \
	&& apt-get clean

COPY git_key.pub /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd

RUN mkdir /git
VOLUME /git

EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D
