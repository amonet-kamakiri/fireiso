#!/bin/bash

set -e

pacman -Syu  --noconfirm arch-install-scripts mtools base-devel edk2-shell

# build the kernel as non-root
cp -r /vagrant/linux-lts /home/vagrant/
chown -R vagrant.vagrant /home/vagrant/linux-lts
sudo -u vagrant bash /vagrant/scripts/kernel.sh

# build archiso-43
cp -r /vagrant/archiso-43 /home/vagrant/archiso
chown -R vagrant.vagrant /home/vagrant/archiso
sudo -u vagrant bash /vagrant/scripts/archiso.sh

cp -r /vagrant/archiso /root/
cd /root/archiso/
./build.sh -v
cp out/*.iso /vagrant
