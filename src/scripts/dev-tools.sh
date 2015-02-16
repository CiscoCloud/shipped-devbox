#!/bin/bash
set -ex

# Git
yum install -y git 

# Docker
yum install -y http://cbs.centos.org/kojifiles/packages/docker/1.4.1/2.el7/x86_64/docker-1.4.1-2.el7.x86_64.rpm
systemctl enable docker
usermod -a -G docker vagrant

# Fig
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 > /usr/bin/fig
chmod +x /usr/bin/fig

# EOF
