# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "python-dev-vm"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.box = "ubuntu/trusty64"

  #shared
  config.vm.synced_folder "./projects", "/projects", type: 'nfs'

  #virtualbox
  if defined? VagrantVbguest
    config.vbguest.auto_update = true
  end

  config.vm.provision "shell" do |sh|
    sh.path = "./bin/bootstrap.sh"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "./manifests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path = "./modules"
    puppet.options = "--verbose --debug"
    #puppet.options = "--verbose --noop"
  end
  
end
