#!/bin/bash
sudo yum install epel-release -y
sudo yum install easy-rsa -y
sudo yum install openvpn -y
sudo mkdir /etc/openvpn/easy-rsa
sudo mkdir /etc/openvpn/easy-rsa/keys
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/dh1024.pem /etc/openvpn/easy-rsa/keys
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/ca.crt /etc/openvpn/easy-rsa/keys
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/server.crt /etc/openvpn/easy-rsa/keys
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/server.key /etc/openvpn/easy-rsa/keys
sudo cp /vagrant/salt/openvpn/openvpn-ca/server.conf /etc/openvpn/server.conf
sudo cp /vagrant/salt/openvpn/openvpn-ca/forward.conf /etc/sysctl.d/forward.conf
sudo systemctl start firewalld
sudo firewall-cmd --add-service openvpn
sudo firewall-cmd --add-masquerade
sudo systemctl restart network.service
sudo systemctl start openvpn@server.service
sudo systemctl -f enable openvpn@service.service
