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
  if ENV['VAGRANT_BOX_VERSION']
    config.vm.box_version = ENV['VAGRANT_BOX_VERSION']
  else
  	config.vm.box_check_update = true
  end
  
  #config.vm.network "private_network", ip: ENV['PRIVATE_IP'], auto_config: false
  config.vm.network :private_network, ip: ENV['PRIVATE_IP']
  if ENV['PUBLIC_IP']
	  config.vm.network "public_network", ip: ENV['PUBLIC_IP'] # Without this the private ip not work
  end
 
  config.vm.synced_folder "./", "/vagrant"
  config.vm.synced_folder ENV['FOLDER_PROJECTS'], "/projects"

  config.ssh.forward_agent = true

  config.vm.define ENV['MASHINE_NAME']
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = ENV['MASHINE_NAME']

    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
	
	# Customize Display Settings
	vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ['modifyvm', :id, '--vram', '128']
    vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
    
	# Enable Audio
	#vb.customize ["modifyvm", :id, "--audio", "alsa"]
    #vb.customize ["modifyvm", :id, "--audioout", "on"]
    
    # Enable USB 2.0
    #vb.customize ["modifyvm", :id, "--usb", "on"]
    #vb.customize ["modifyvm", :id, "--usbehci", "on"]

    # # Customize the amount of memory on the VM:
    # vb.memory = ENV['VBOX_MACHINE_MEMORY']
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Run provision bash scripts to setup the environement
  config.vm.provision "shell", path: "vagrant.d/provision/main.sh"

  # Run Ansible to reconfigure how i want it
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook 			= "vs_playbook.yml"
    ansible.galaxy_role_file 	= "vs_requirements.yml"
    #ansible.verbose        	= true
    ansible.extra_vars = {
        gitCredentials: ENV['GIT_CREDENTIALS'],
    }
  end
end
