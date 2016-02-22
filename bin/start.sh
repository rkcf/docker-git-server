#!/bin/sh
docker run --detach \
	--restart=unless-stopped:3
	--publish 8080:22 \
	--name git_ssh_server \
	fckr/git_ssh_srv
