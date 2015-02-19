shipped-devbox
==============

Developer vagrant box for Shipped.

# Requires:
* VirtualBox >= 4.3.14 [Download](https://www.virtualbox.org/wiki/Downloads)
* Packer [Download](https://www.packer.io/downloads.html)
* make
* internet access

# Packer Install
* On MacOS X, after downloading the Packer package, you need to copy the executables to `/usr/local/bin`.


# Build:

```
$ make all
```

# Usage:

```
$ make install
$ vagrant box add --name=shipped-devbox shipped-devbox.box
$ vagrant up --provider virtualbox
$ vagrant ssh
```
