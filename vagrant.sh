#!/bin/bash
set -ex
apt-get update -y
apt-get install -y python-dev python-pip git-core
# optimize TCP/IP settings
sysctl -w net.core.somaxconn=10000
sysctl -w net.ipv4.tcp_max_syn_backlog=10000
cd /vagrant
pip install -r requirements.txt