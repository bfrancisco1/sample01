#!/bin/bash
sudo yum install epel-release -y
sudo yum install openvpn -y
sudo cp /vagrant/salt/openvpn/openvpn-ca/client.ovpn /etc/openvpn
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/client.crt /etc/openvpn
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/client.key /etc/openvpn
sudo cp /vagrant/salt/openvpn/openvpn-ca/keys/ca.crt /etc/openvpn