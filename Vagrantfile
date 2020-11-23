# -*- mode: ruby -*-
# vi: set ft=ruby :

def fail_with_message( msg )
	fail Vagrant::Errors::VagrantError.new, msg
end

if ! Vagrant.has_plugin? 'vagrant-env'
	fail_with_message "vagrant-env missing, please install the plugin with this command:
			vagrant plugin install vagrant-env"
end

# Workaround for changed server URL. Can be removed when using vagrant 2.x.
#Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.env.enable
  
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = ENV['VAGRANT_BOX']
  config.vm.box_check_update = true
  #config.vm.box_version = "1.2.0"
  #config.vm.box_version = "2.0.0"
  
  config.vm.network :private_network, ip: ENV['PUBLIC_IP']
  
  config.vm.synced_folder "examples/", "/home/vagrant/example_projects/",
    owner: "vagrant", group: "vagrant"
    
  config.vm.synced_folder "./", "/vagrant"
  config.vm.synced_folder ENV['FOLDER_PROJECTS'], "/projects"

  config.ssh.forward_agent = true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = ENV['MASHINE_NAME']

    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Enable USB 2.0
    #vb.customize ["modifyvm", :id, "--usb", "on"]
    #vb.customize ["modifyvm", :id, "--usbehci", "on"]

    # # Customize the amount of memory on the VM:
    # vb.memory = ENV['VBOX_MACHINE_MEMORY']
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Run Ansible to install Git into the VM (for using Ansible Galaxy later on)
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook	= "bootstrap.yml"
    #ansible.verbose	= true
  end

  # Run Ansible from wthin the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook 			= "playbook.yml"
    ansible.galaxy_role_file 	= "requirements.yml"
    #ansible.verbose        		= true
  end
  
  # Run Ansible to reconfigure how i want it
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook 			= "vs_playbook.yml"
    ansible.galaxy_role_file 	= "vs_requirements.yml"
    #ansible.verbose        		= true
  end
end
