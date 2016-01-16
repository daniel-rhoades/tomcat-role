Vagrant.configure(2) do |config|
    config.vm.define "main", primary: true do |node|
        node.vm.box = "ubuntu/trusty64"

        node.vm.provision "ansible" do |ansible|
            ansible.playbook = "test.yml"
            ansible.sudo = true
            ansible.verbose = "vvv"
        end
    end
end