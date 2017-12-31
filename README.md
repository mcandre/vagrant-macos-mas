# vagrant-macos-mas: a Vagrant box with mas preinstalled

# DISCLAIMER

Unfortunately, mas itself appears to be broken at the moment for High Sierra installs.

# EXAMPLE

```console
$ cp app-store-credentials.sample.sh app-store-credentials.sh
$ vi app-store-credentials.sh
(supply valid credentials)
...
ESC:wqa

$ vagrant up
$ vagrant ssh -c ". /vagrant/app-store-credentials.sh && mas signin \\"$APPLE_ID\\" \\"$APPLE_PASSWORD\\""
$ vagrant ssh -c "APP_ID=\\$(mas search Xcode | head -n 1 | awk '{ print $1 }') && mas install \\$APP_ID && xcodebuild -version"
...
```

# REQUIREMENTS

* [macOS Vagrant base box](https://github.com/mcandre/packer-templates/tree/master/macos)
* [Vagrant](https://www.vagrantup.com)
* [VMware](https://www.vmware.com)
* [vagrant-vmware-{fusion,workstation} plugin](https://www.vagrantup.com/vmware/index.html)

# EXPORT

Unfortunately, VMware-provided Vagrant VM's are not easy to export for reuse in downstream Vagrant boxes.
