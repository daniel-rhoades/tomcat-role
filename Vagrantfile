VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "main"

    config.vm.box = "ubuntu/trusty64"

    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provision "docker" do |d|
        d.build_image "/vagrant/", args: "-t tomcat_trusty -f /vagrant/tests/Dockerfile-ubuntu14.04"
        d.run "tomcat_trusty", args: "-p 8080:8080"
    end
end