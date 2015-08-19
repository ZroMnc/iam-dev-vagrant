#!/usr/bin/env bash
apt-get update
apt-get install -y software-properties-common git vim docker.io vim-syntax-docker python3-pip
echo 'alias python=python3' >> /home/vagrant/.bashrc
echo 'deb http://repo.zalando/apt/ubuntu14.04/public ubuntu14.04 main' > /etc/apt/sources.list.d/zalando.list
wget --quiet -O - http://repo.zalando/repo.zalando.key | sudo apt-key add -
apt-get update
apt-get install -y zalando-service-ca
apt-get install -y unattended-upgrades 
# [+] Done
