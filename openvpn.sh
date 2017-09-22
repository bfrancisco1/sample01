#!/bin/bash
sudo yum install easy-rsa -y
sudo yum install openvpn -y
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/dh2048.pem /etc/openvpn/
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/ca.crt /etc/openvpn/
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/server.crt /etc/openvpn/
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/ta.key /etc/openvpn/
sudo cp /vagrant/salt/openvpn/openvpn-ca/server.conf /etc/openvpn/server.conf
sudo cp /vagrant/salt/openvpn/openvpn-ca/forward.conf /etc/sysctl.d/forward.conf
sudo systemctl restart.network.service
sudo systemctl -f enable openvpn@service.service
