#!/bin/bash
set -ex
apt-get update -y
apt-get install -y python-dev python-pip python-virtualenv
# optimize TCP/IP settings
sysctl -w net.core.somaxconn=10000
sysctl -w net.ipv4.tcp_max_syn_backlog=10000
# install virtualenv... TODO
# virtualenv /home/vagrant/virtenv
# source /home/vagrant/virtenv/bin/activate
# pip install locustio