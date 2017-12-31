.PHONY: launch-vm clean-vm clean-boxes clean-vagrant-metadata

launch-vm: Vagrantfile bootstrap.sh
	vagrant up

test: launch-vm
	vagrant ssh -c ". /vagrant/app-store-credentials.sh && mas signin \\"$$APPLE_ID\\" \\"$$APPLE_PASSWORD\\""
	vagrant ssh -c "APP_ID=\\$$(mas search Xcode | head -n 1 | awk '{ print $1 }') && mas install \\$$APP_ID && xcodebuild -version"

clean-vm:
	-vagrant destroy -f

clean-boxes:
	-rm -rf *.box

clean-vagrant-metadata:
	-rm -rf .vagrant

clean: clean-boxes clean-vm clean-vagrant-metadata
