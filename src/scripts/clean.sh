#!/bin/bash
set -x

# delete interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules

# remove uuid and mac address
sed -i '/UUID/d' /etc/sysconfig/network-scripts/ifcfg-e*
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-e*

# delete yum cache
yum clean all

# delete /tmp
rm -rf /tmp/*

# delete files in home
find "$HOME" -type f -delete

# delete logs
find /var/log -type f -delete

# zero out empty space
dd if=/dev/zero of=/ZERO bs=1M
rm -rf /ZERO

# EOF
