# -*- mode: ruby -*-
# vi: set ft=ruby :

# REQUIREMENTS:
# librarian-chef install # to download all cookbooks
# vagrant plugin install vagrant-omnibus # to force chef version

# vagrant provision
# vagrant ssh squid0
#
# http://156.17.130.10/sw/
#
# ssh root@my_server "chef-solo -c /var/chef/solo.rb"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  (0..2).each do |i|
    config.vm.define "squid#{i}".to_sym do |cfg|
      cfg.vm.hostname = "squid#{i}"
	  cfg.vm.box = "hashicorp/precise64"
      cfg.vm.box_check_update = false
      cfg.omnibus.chef_version = "11.4.0" # :latest

      cfg.vm.base_mac = "0800000021#{i}1"

      # communication between VMs
      # f.e. 192.168.1.10, 192.168.1.11, 192.168.1.13
      cfg.vm.network :private_network, ip: "192.168.56.10#{i+1}", mac: "0800000021#{i}2"

      # chef provisioning
      config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks", "m_cookbooks"]
        chef.add_recipe "apt"
        chef.add_recipe "curl"
        chef.add_recipe "squid"

        chef.add_recipe "taskA"
		
      end
    end
  end

end
