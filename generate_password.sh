#!/bin/bash

pw1=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)
pw2=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)
pw3=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)

sed -i "/^NEXTCLOUD_DATABASE_ROOT/c\\\NEXTCLOUD_DATABASE_ROOT=${pw1}" nextcloud.conf
sed -i "/^NEXTCLOUD_DATABASE_PASSWORD/c\\\NEXTCLOUD_DATABASE_PASSWORD=${pw2}" nextcloud.conf
sed -i "/^NEXTCLOUD_ADMIN_PASSWORD/c\\\NEXTCLOUD_ADMIN_PASSWORD=${pw3}" nextcloud.conf
