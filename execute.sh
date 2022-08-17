#!/bin/bash
## Install the Vagrant package either in your CentOS 7/8 or Ubuntu 18.04 >
if [ -f /etc/redhat-release ]; then
  sudo yum update
  sudo yum -y install kernel-headers kernel-devel binutils glibc-headers glibc-devel font-forge wget
  wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.rpm
  sudo rpm -i vagrant_2.2.19_x86_64.rpm
  vagrant --version
fi

if [ -f /etc/lsb-release ]; then
  sudo apt-get update
  wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
  sudo apt install ./vagrant_2.2.19_x86_64.deb
  vagrant --version
fi
## Execute the vagrant comamnd
vagrant up

## Add a hosts entry in Local
sed  -i '1i  192.168.0.200  my-google.com' /etc/hosts
dig my-google.com
