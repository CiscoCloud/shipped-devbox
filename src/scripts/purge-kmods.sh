#!/bin/bash
 
# test for root effective privlidges
if [[ "$(id -u)" -ne 0 ]]; then
    echo "Error: $0 must execute as root."
    exit 1
fi

# create list of kernel modules in use
lsmod | awk '$3 > 0 && NR > 1 { print $1 }' > /tmp/kmod.lst
 
# purge all kernel modules not in use
find /lib/modules -type f -name '*.ko' | while read KMOD; do
    sed -re '/^(#.*)?$/d' /tmp/kmod.lst | egrep -q "^$(basename ${KMOD%%.ko})$" || rm -f "$KMOD"
done

# delete list of kernel modules
rm -f /tmp/kmod.lst
 
# EOF
