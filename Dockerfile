FROM ubuntu:15.04
MAINTAINER zoombafu

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y git openssh-server \
	&& apt-get clean

COPY git_key.pub /root/.ssh/authorized_keys
copy ./conf/sshd_config /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

RUN mkdir /git
VOLUME /git

EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D
