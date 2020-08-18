# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  
  config.vm.hostname = "ojs"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.network :forwarded_port, guest: 80, host: 8000 # Apache
  config.vm.network :forwarded_port, guest: 3306, host: 3307 # MySQL
  config.vm.network :forwarded_port, guest: 443, host: 8443 # SSL

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", '3000']
    vb.customize ["modifyvm", :id, "--cpus", "2"]   
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  shared_dir = "/vagrant"

  config.vm.provision :shell, path: "./scripts/setup.sh"
end
