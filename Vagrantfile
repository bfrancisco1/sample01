# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "saltmaster" do |saltmaster|
    saltmaster.vm.box = "bento/centos-7.2"
    saltmaster.vm.hostname = "saltmaster.test"
    saltmaster.vm.synced_folder "./salt", "/srv/salt"
    saltmaster.vm.synced_folder "./pillar", "/srv/pillar"
    saltmaster.vm.network "private_network", ip: "192.168.101.10"
    saltmaster.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["-M", "-A", "127.0.0.1", "stable", "2017.7.1"]
    end
    saltmaster.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "bento/centos-7.2"
    web01.vm.hostname = "web01.test"
    web01.vm.network "private_network", ip: "192.168.102.12",
      virtualbox__intnet: "webnetwork"
    web01.vm.network "forwarded_port", guest: 80, host: 8080
    web01.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["-A","192.168.101.10", "stable", "2017.7.1"]
    end
    web01.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end

  config.vm.define "client01" do |client01|
    client01.vm.box = "chad-thompson/ubuntu-trusty64-gui"
    client01.vm.hostname = "client01.test"
    client01.vm.network "private_network", ip: "192.168.102.13",
      virtualbox__intnet: "webnetwork"
    client01.vm.provider "virutalbox" do |v|
      v.memory = 256
      v.cpus = 1
    end
  end

  config.vm.define "vpnserver" do |vpnserver|
    vpnserver.vm.box = "bento/centos-7.2"
    vpnserver.vm.hostname = "vpnserver.test"
    vpnserver.vm.network "private_network", ip: "192.168.101.11"
    vpnserver.vm.network "private_network", ip: "192.168.102.11",
      virtualbox__intnet: "webnetwork"
    vpnserver.vm.provision "shell" do |s|
      s.path = "bootstrap.sh"
      s.args = ["-A","192.168.101.10", "stable", "2017.7.1"]
    end
    vpnserver.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 2
    end
  end

end
