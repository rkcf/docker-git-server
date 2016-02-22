#!/bin/sh
DATE=`date +%d-%m-%y`
NAME=$DATE"_backup.tar.gz"
HOST_LOCATION="/var/container_data/git/backups"
docker run --rm  --volumes-from git_ssh_server -v $HOST_LOCATION:/backup \
	ubuntu:14.04 tar cvzf /backup/$NAME /git
