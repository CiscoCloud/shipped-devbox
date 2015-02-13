#!/bin/bash
set -x

# install dependencies
rpm -qa > rpms-before
yum install make bzip2 gcc kernel-devel kernel-headers --assumeyes
rpm -qa > rpms-after

# install virtualbox guest additions
VERSION=$(cat .vbox_version)
mount -o loop VBoxGuestAdditions_${VERSION}.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# clean up
rm -f .vbox_version && rm -f VBoxGuestAdditions_${VERSION}.iso
yum remove $(join -v 2 <(sort rpms-before) <(sort rpms-after)) --assumeyes

# EOF
