FROM alpine:3.8
MAINTAINER rkcf

RUN apk update && apk upgrade \
	&& apk add openssh git

COPY git_key.pub /root/.ssh/authorized_keys
copy ./conf/sshd_config /etc/ssh/sshd_config

RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 \
	&& ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa \
	&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
	&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
	

RUN mkdir /var/run/sshd

RUN mkdir /git
VOLUME /git

EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D
