# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |c|
  c.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

   c.vm.define :dev do |dev|
    dev.vm.box = "ubuntu/trusty64"
    dev.vm.network :private_network, ip: "192.168.33.15"
    dev.vm.hostname = "dev.redpanda.com"
    dev.vm.synced_folder "files/", "/files" 
    dev.vm.provision "shell", path: "prepare.sh"
    dev.vm.provision :shell, path: "bootstrap.sh"

    dev.vm.provision "shell", inline: <<-SHELL
        sudo apt-get install -y unattended-upgrades 
        sudo apt-get install -y software-properties-common
        sudo apt-get install git -y
        sudo apt-get install vim -y
        sudo apt-get install docker.io -y
        sudo apt-get install vim-syntax-docker -y
        sudo apt-get install -y unzip
        sudo apt-get install -y python3-pip
        sudo pip3 install --upgrade stups
        sudo pip3 install --upgrade token
        sudo apt-get install -y golang golang-tools
        sudo apt-get install openjdk-7-jre-headless
    SHELL
   end
end
