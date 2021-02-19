#!/bin/bash

set -e

# build archiso
cd /home/vagrant/archiso
nproc=$(( $(nproc) * 2 ))
export MAKEFLAGS="-j$nproc"
makepkg -scC --skippgpcheck --noconfirm
makepkg --install --noconfirm
