#!/bin/bash
set -x
 
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
