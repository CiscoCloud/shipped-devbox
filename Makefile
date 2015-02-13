all: build

build:
	packer build -force src/packer/shipped.json

install:
	vagrant box add shipped-virtualbox.box --name shipped

clean:
	rm -f shipped-virtualbox.box
	rm -rf output-virtualbox-iso
