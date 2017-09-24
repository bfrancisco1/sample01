#!/bin/sh
sudo yum groupinstall "Gnome Desktop" -y
sudo systemctl enable graphical.target --force
sudo rm '/etc/systemd/system/default.target'
sudo ln -s '/usr/lib/systemd/system/graphical.target' '/etc/systemd/system/default.target'
sudo reboot