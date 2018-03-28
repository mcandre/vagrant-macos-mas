.PHONY: clean-vm clean-vagrant-metadata

all: test

test: test-package-manager

test-boot:
	vagrant up

test-package-manager: test-boot
	vagrant ssh -c ". /vagrant/app-store-credentials.sh && mas signin \\"$$APPLE_ID\\" \\"$$APPLE_PASSWORD\\""
	vagrant ssh -c "APP_ID=\\$$(mas search Xcode | head -n 1 | awk '{ print $1 }') && mas install \\$$APP_ID && xcodebuild -version"

clean-vm:
	-vagrant destroy -f

clean-vagrant-metadata:
	-rm -rf .vagrant

clean: clean-vm clean-vagrant-metadata
