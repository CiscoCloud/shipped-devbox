#!/bin/bash
set -ex

# Git
yum install -y git 

# Docker
yum install -y docker
systemctl enable docker
usermod -a -G docker vagrant

# Fig
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-Linux-x86_64 > /usr/bin/fig
chmod +x /usr/bin/fig

# EOF
