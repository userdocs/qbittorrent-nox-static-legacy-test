FROM alpine:latest AS builder

RUN apk update \
	&& apk upgrade \
	&& apk add sudo \
	&& adduser -Ds /bin/bash -u 1000 username \
	&& printf '%s' 'username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

ADD --chown=username:username --chmod=700 "qbittorrent-nox-static.sh" /usr/local/bin/qbittorrent-nox-static.sh

USER username

WORKDIR /home/username
