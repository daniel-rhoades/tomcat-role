VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "main"

    config.vm.box = "ubuntu/trusty64"

    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provision "shell", inline: "mkdir -p /tmp/distributions"
    config.vm.provision "shell", inline: "sudo chown vagrant.vagrant /tmp/distributions"
    config.vm.provision "shell", inline: "wget -nc https://github.com/daniel-rhoades/simple-jsf-example/releases/download/v0.1/simple-jsf-example.war -q -O /tmp/distributions/simple-jsf-example.war"

    config.vm.provision "docker" do |d|
        d.build_image "/vagrant/", args: "-t tomcat_trusty -f /vagrant/tests/Dockerfile-ubuntu14.04"
        # d.run "tomcat_trusty", args: "-p 8080:8080 -e WEBAPP_DISTRO_URL=https://github.com/daniel-rhoades/simple-jsf-example/releases/download/v0.1/simple-jsf-example.war"
        d.run "tomcat_trusty", args: "-p 8080:8080 --volume /tmp/distributions:/opt/cms/distributions"
    end

    # Sync the user's home folder
    config.vm.synced_folder "~/", "/home/host-machine"
end
