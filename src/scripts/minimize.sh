#!/bin/bash

# create list of loaded kernel modules
lsmod | awk 'NR > 1 { print $1 }' > /tmp/kmod.lst
 
# delete all unloaded kernel modules
find /lib/modules -type f -name '*.ko' | while read KMOD; do
    sed -re '/^(#.*)?$/d' /tmp/kmod.lst | egrep -q "^$(basename ${KMOD%%.ko})$" || rm -f "$KMOD"
done
 
# reduce size of locale files
localedef --list-archive | grep -a -v "en_US" | xargs localedef --delete-from-archive
cp /usr/lib/locale/locale-archive{,.tmpl}
build-locale-archive
find /usr/{{lib,share}/locale,bin/localedef} -type f | grep -a -v "en_US" | xargs rm

# delete non-utf character sets
find /usr/lib64/gconv/ -type f ! -name "UTF*" -delete

# delete docs
find /usr/share/{man,doc,info,gnome} -type f -delete

# delete i18n
find /usr/share/i18n -type f -delete

# delete cracklib
find /usr/share/cracklib -type f -delete

# delete timezones
find /usr/share/zoneinfo -type f \( ! -name "Etc" ! -name "UTC" \) -delete

# EOF
