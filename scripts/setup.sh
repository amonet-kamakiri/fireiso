#!/bin/bash

set -e

pacman -Syu  --noconfirm archiso arch-install-scripts mtools base-devel

# build the kernel as non-root
cp -r /vagrant/linux-lts /home/vagrant/
chown -R vagrant.vagrant /home/vagrant/linux-lts
sudo -u vagrant bash /vagrant/scripts/kernel.sh

cp -r /vagrant/archiso /root/
cd /root/archiso/
./build.sh -v
cp out/*.iso /vagrant
