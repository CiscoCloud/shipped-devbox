shipped-devbox
==============

This code is used to build the developer vagrant box for Cisco Shipped.


### Provides:
* CentOS 7 x86_64 (minimal)
* Docker
* Docker-compose

### Build Requires:
* VirtualBox >= 4.3.14 [Download](https://www.virtualbox.org/wiki/Downloads)
* Packer [Download](https://www.packer.io/downloads.html)
* make
* internet access

### Build:

```
$ make all
```

### Usage:

```
$ make install
$ vagrant up
$ vagrant ssh
```

### Packer installation note:
* On MacOS X, after downloading the Packer package, copy the executables to `/usr/local/bin`.
