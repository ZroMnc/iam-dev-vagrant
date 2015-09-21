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
    dev.ssh.forward_agent = true
    dev.vm.hostname = "dev.redpanda.com"
    dev.vm.synced_folder "files/", "/files" 
    dev.vm.provision "shell", path: "prepare.sh"
    dev.vm.provision "shell", path: "bootstrap.sh"

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
        sudo apt-get install -y openjdk-7-jre-headless
        sudo apt-get install -y awscli
    SHELL
   end

   c.vm.define "kafka" do |kafka|
    kafka.vm.box = "ubuntu/trusty64"
    kafka.vm.network :private_network, ip: "192.168.33.17"
    kafka.ssh.forward_agent = true
    kafka.vm.hostname = "kafka.redpanda.com"
    kafka.vm.synced_folder "files/", "/files" 
    kafka.vm.provision "shell", path: "prepare.sh"
   end

   c.vm.define :am do |am|
    am.vm.box = "ubuntu/trusty64"
    am.vm.network :private_network, ip: "192.168.33.16"
    am.ssh.forward_agent = true
    am.vm.hostname = "am.redpanda.com"
    am.vm.synced_folder "files/", "/files" 
    am.vm.provision "shell", path: "prepare.sh"
    am.vm.provision "shell", path: "ambuild.sh"
   end
end
