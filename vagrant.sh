#!/bin/bash
set -ex
apt-get update -y
apt-get install -y python-dev python-pip git-core dnsmasq
git config --global credential.helper cache
# optimize TCP/IP settings for massive load testing
echo 'net.core.somaxconn=65535' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog=65535' >> /etc/sysctl.conf
echo 'fs.file-max=65535' >> /etc/sysctl.conf
sysctl -p
sed -i "s/#define NR_OPEN.*/#define NR_OPEN        65536/g" /usr/include/linux/limits.h
echo '*       soft    nofile      65536' >> /etc/security/limits.conf
echo '*       hard    nofile      65536' >> /etc/security/limits.conf
# setup local DNS cache: http://community.linuxmint.com/tutorial/view/489
sed -i "s/#listen-address=/listen-address=127\.0\.0\.1/g" /etc/dnsmasq.conf
sed -i "s/#prepend domain-name-servers 127\.0\.0\.1;/prepend domain-name-servers 127\.0\.0\.1;/g" /etc/dhcp/dhclient.conf
sed -i "s/#require subnet-mask, domain-name-servers;/require subnet-mask, domain-name-servers;/g" /etc/dhcp/dhclient.conf
sed -i "s/#timeout 60;/timeout 60;/g" /etc/dhcp/dhclient.conf
sed -i "s/#retry 60;/retry 60;/g" /etc/dhcp/dhclient.conf
sed -i "s/#reboot 10;/reboot 10;/g" /etc/dhcp/dhclient.conf
sed -i "s/#select-timeout 5;/select-timeout 5;/g" /etc/dhcp/dhclient.conf
sed -i "s/#initial-interval 2;/initial-interval 2;/g" /etc/dhcp/dhclient.conf
/etc/init.d/dnsmasq restart
cd /vagrant
pip install -r requirements.txt