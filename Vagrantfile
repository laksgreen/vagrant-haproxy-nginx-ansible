# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "public_network", auto_config: false
  config.vm.box = "centos/7"
  config.vm.provision :shell, path: "./install.sh"
  config.vm.provider "virtualbox" do |vb| 
    vb.memory = "512"
    vb.cpus = "1"
  end
  # Configure the haproxy1
  config.vm.define "haproxy1" do |haproxyconfig|
    haproxyconfig.vm.hostname = "haproxy1"
    haproxyconfig.vm.network "public_network", bridge: "wlp0s20f3", ip: "192.168.0.101"
    #haproxyconfig.vm.network :forwarded_port, guest: 443, host: 443
    haproxyconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/haproxy.yml"
      ansible.extra_vars = {
        state: 'MASTER',
        interface: 'eth1',
        virtual_router_id: 52,
        priority: 200,
        unicast_src_ip: '192.168.0.101',
        unicast_peer: '192.168.0.102',
        virtual_ip_address: '192.168.0.200'
      }
    end
  end
  # Configure the haproxy2
  config.vm.define "haproxy2" do |haproxyconfig|
    haproxyconfig.vm.hostname = "haproxy2"
    haproxyconfig.vm.network "public_network", bridge: "wlp0s20f3", ip: "192.168.1.102"
    #haproxy1_config.vm.network :forwarded_port, guest: 443, host: 444
    haproxyconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/haproxy.yml"
      ansible.extra_vars = {
        state: 'BACKUP',
        interface: 'eth1',
        virtual_router_id: 52,
        priority: 201,
        unicast_src_ip: '192.168.0.102',
        unicast_peer: '192.168.0.101',
        virtual_ip_address: '192.168.0.200'
     }
    end
  end
end
