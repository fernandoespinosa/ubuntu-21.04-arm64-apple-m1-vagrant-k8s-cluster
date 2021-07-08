# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "local/ubuntu-21.04-arm64-apple-m1"
WORKER_COUNT = 2

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.define "master" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "master"
    subconfig.vm.network :private_network, ip: "10.0.0.10"
    subconfig.vm.provider "parallels" do |prl|
      prl.memory = 2048
      prl.cpus = 2
    end
  end

  (1..WORKER_COUNT).each do |i|
    config.vm.define "worker-#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "worker-#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}"
      subconfig.vm.provider "parallels" do |prl|
        prl.memory = 1048
        prl.cpus = 1
      end
    end
  end
end
