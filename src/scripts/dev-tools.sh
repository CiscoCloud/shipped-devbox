#!/bin/bash
set -ex

# git
yum install -y git 

# docker
yum install -y docker
systemctl enable docker
groupadd docker
usermod -a -G docker vagrant

# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# EOF
