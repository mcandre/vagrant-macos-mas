# vagrant-macos-mas: a Vagrant box with mas preinstalled

# DISCLAIMER

Unfortunately, mas itself appears to be broken at the moment for High Sierra installs.

# EXAMPLE

```console
$ cp app-store-credentials.sample.sh app-store-credentials.sh
$ nano app-store-credentials.sh
...

$ vagrant up
$ vagrant ssh -c ". /vagrant/app-store-credentials.sh && mas signin \\"$APPLE_ID\\" \\"$APPLE_PASSWORD\\""
$ vagrant ssh -c "APP_ID=\\$(mas search Xcode | head -n 1 | awk '{ print $1 }') && mas install \\$APP_ID && xcodebuild -version"
...
```

# REQUIREMENTS

* [Vagrant](https://www.vagrantup.com)
* [VirtualBox](https://www.virtualbox.org/) and/or [VMware](https://www.vmware.com)
* [vagrant-vmware-{fusion,workstation} plugin](https://www.vagrantup.com/vmware/index.html)
* [vagrant-package-vmware](https://github.com/bacongravy/vagrant-package-vmware)

## Recommended

* [vagrant-rsync-back](https://github.com/smerrill/vagrant-rsync-back) assists in copying artifacts from the guest to the host

# EXPORT

```console
$ make boxes
```
