all: build

build:
	packer build -force src/packer/shipped-devbox.json

install:
	vagrant box add shipped-devbox.box --name shipped-devbox

clean:
	rm -f shipped-devbox.box
	rm -rf output-virtualbox-iso
