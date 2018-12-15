# https://github.com/StefanScherer/docker-windows-box/blob/master/Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.define "wocker"
  config.vm.guest = "windows"

  config.vm.box          = "StefanScherer/windows_2019"
  config.vm.communicator = "winrm"
  
  
  config.vm.network :forwarded_port, guest: 9516, host: 5555
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.linked_clone = true

    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--vram", 128]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]

    if false
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
      vb.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
    end

    # Guest additions requires optical driver
    vb.customize ["storageattach", :id,
                    "--storagectl", "IDE Controller",
                    "--port", "0", "--device", "1",
                    "--type", "dvddrive",
                    "--medium", "emptydrive"]
  end

  config.vm.provision "shell", inline: '&netsh "advfirewall" "set" "allprofiles" "state" "off"'

  
    
      config.vm.provision "shell", path: 'install-chocolatey.ps1'
    
  
    
      config.vm.provision "shell", inline: 'choco install -y ruby'
    
  
    
      config.vm.provision "shell", inline: 'choco install -y nircmd'
    
  
    
      config.vm.provision "shell", inline: 'gem install delirium-driver'
    
  

  config.vm.provision :reload
end
