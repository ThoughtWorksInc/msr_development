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
  

  #TODO sync local repos to the vagrant box
  config.vm.synced_folder "spring-boot-example", "/var/spring-boot-example", 
                          type: "rsync", rsync__exclude: [".git/", "build/"]

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
    vb.name = "Local Dev"
  end

  config.vm.provision "shell", path: "scripts/bootstrap.sh", env: {"FAST_PROVISION" => ENV["FAST_PROVISION"]}
  # config.vm.provision "file", source: "build.sh", destination: "build.sh"
  # config.vm.provision "file", source: "Dockerfile.ubuntu", destination: "Dockerfile.ubuntu"
  # config.vm.provision "file", source: "Dockerfile.alpine", destination: "Dockerfile.alpine"
end
