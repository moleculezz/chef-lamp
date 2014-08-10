#Vagrant.require_plugin "vagrant-chef-zero"

Vagrant.configure("2") do |config|

  config.vm.hostname = "lamp-berkshelf"
  config.vm.box = "debian73"
  config.vm.box_url = "https://dl.dropboxusercontent.com/s/13c6vqf9saqzanj/debian73.box?dl=1&token_hash=AAH7T-Iubj8f0m34dbHAM-eV3Jt62dMHuIfZKbEVC9t3Ww"
  config.omnibus.chef_version = :latest
  config.vm.network :public_network
  config.vm.boot_timeout = 120

  config.chef_zero.chef_repo_path = "."
  config.chef_zero.data_bags = "./data_bags"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Enabling the Berkshelf plugin.
  config.berkshelf.enabled = true

  config.vm.provision :chef_client do |chef|
    chef.run_list = [
        "recipe[base]",
        "recipe[lamp::php]"
    ]
  end
end
