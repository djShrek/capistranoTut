Vagrant::Config.run do |config|
  config.vm.box = "deploygrant"
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  # config.vm.boot_mode = :gui
  config.vm.network :bridged
  # config.vm.forward_port 80, 8080

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "../vagrant-config/cookbooks"
    chef.roles_path     = "../vagrant-config/roles"
    chef.data_bags_path = "../vagrant-config/data_bags"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "nginx"
    chef.add_recipe "rbenv"

    chef.json = {
      postgresql: {
        password: {
          postgres: "secret"
        }
      }
    }
  end

end
