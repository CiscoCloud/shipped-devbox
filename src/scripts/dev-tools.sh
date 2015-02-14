#!/bin/bash
set -ex

# Setup Docker.
yum install docker -y
systemctl enable docker
usermod -a -G docker vagrant

# Setup Fig.
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 > /usr/bin/fig
chmod +x /usr/bin/fig

# EOF
