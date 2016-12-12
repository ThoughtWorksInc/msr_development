# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.insert_key = false 
  config.ssh.forward_agent = true
  config.ssh.private_key_path = ["~/.vagrant.d/insecure_private_key", File.expand_path("~/.ssh/id_rsa", __FILE__)]
  config.vm.provision "file", source: File.expand_path("~/.ssh/id_rsa.pub", __FILE__), destination: "~/.ssh/authorized_keys"

  config.vm.network "private_network", ip: "192.168.33.10"
  for port in 8080..8085
    config.vm.network :forwarded_port, guest: port, host: port, protocol: "tcp"
  end
  config.vm.network :forwarded_port, guest: 27017, host: 27017, protocol: "tcp"

  File.foreach('repositories.txt') do |repo|
    /.*\/([\w-]+)\.git/ =~ repo
    name = $1
    config.vm.synced_folder name, "/var/#{name}", type: 'rsync', rsync__exclude: '.git/'
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
    vb.name = "Local Dev"
  end

  config.vm.provision "file", source: "assets/mysql-apt-config_0.8.0-1_all.deb", destination: ".setup/mysql-apt-config_0.8.0-1_all.deb"
  config.vm.provision "file", source: "scripts/mysql_setup.sh", destination: "mysql_setup.sh"
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
end
