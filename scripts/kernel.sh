#!/bin/bash

set -e

if [ ! -d "/vagrant/repo" ] ; then
	# build the kernel
	cd /home/vagrant/linux-lts
	nproc=$(( $(nproc) * 2 ))
	export MAKEFLAGS="-j$nproc"
	makepkg -scC --skippgpcheck --noconfirm

	# create a repository
	mkdir /home/vagrant/repo
	mv *.pkg.tar.xz /home/vagrant/repo
	cp -r /home/vagrant/repo /vagrant/
else
	cp -r /vagrant/repo /home/vagrant/
fi
cd /home/vagrant/repo
repo-add repo.db.tar.gz *.pkg.tar.xz
