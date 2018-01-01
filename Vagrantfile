# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.vm.box = "centos/7"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 256
    libvirt.cpus = 1
  end

  #config.vm.provider :virtualbox do |v|
  #  v.memory = 256
  #  v.cpus = 1
  #end

  # Define two VMs with static private IP addresses.
  boxes = [
    { :name => "gluster1", :ip => "172.16.10.2" },
    { :name => "gluster2", :ip => "172.16.10.3" }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]

      # Provision both VMs using Ansible after the last VM is booted.
      if opts[:name] == "gluster2"
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "playbooks/provision.yml"
          ansible.inventory_path = "inventory"
          ansible.limit = "all"
        end
      end
    end
  end

end
