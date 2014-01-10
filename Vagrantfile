VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Configure Vagrant Box
  config.vm.box = "ubuntu-server-13.10-min"

  # Include parameters
  filename = './vagrant/parameters'
  if !File.exist?(filename) and !File.file?(filename)
    print "Copy ./vagrant/parameters.dist to ./vagrant/parameters \nand configure it according to your needs.\n"
    exit
  end
  require './vagrant/libs/configuration'
  parameters = Configuration.get_vars(filename)

  # Apply configurations
  ## Shared folders
  use_nfs = if parameters['use_nfs']; parameters['use_nfs'] == 'true' else true end
  config.vm.synced_folder "./", "/var/www/", :nfs => use_nfs

  ## Network settings
  config.vm.network :private_network, ip: parameters['ip']

  ## Aliases
  config.vm.hostname = parameters['project'] + ".dev.example.com"
  config.hostsupdater.aliases = [parameters['project'] + ".mysql.example.com"]

  # Configure Puppet
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = parameters['manifests_path']
    puppet.module_path = parameters['module_path']
    puppet.manifest_file  = parameters['manifest_file']
  end
end
