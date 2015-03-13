#!/bin/bash
set -x

# Create list of loaded kernel modules.
lsmod | awk 'NR > 1 { print $1 }' > /tmp/kmod.lst
 
# Delete all unloaded kernel modules.
find /lib/modules -type f -name '*.ko' | while read KMOD; do
    sed -re '/^(#.*)?$/d' /tmp/kmod.lst | egrep -q "^$(basename ${KMOD%%.ko})$" || rm -f "$KMOD"
done
 
# Reduce size of locale files.
localedef --list-archive | grep -a -v "en_US.utf8" | xargs localedef --delete-from-archive
cp /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
build-locale-archive
:>/usr/lib/locale/locale-archive.tmpl

# Delete non-utf character sets.
find /usr/lib64/gconv/ -type f ! -name "UTF*" -delete

# Delete docs.
find /usr/share/{man,doc,info,gnome} -type f -delete

# Delete i18n.
find /usr/share/i18n -type f -delete

# Delete cracklib.
find /usr/share/cracklib -type f -delete

# Delete timezones.
find /usr/share/zoneinfo -type f \( ! -name "Etc" ! -name "UTC" \) -delete

# EOF
