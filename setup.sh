#!/bin/bash

echo "hello Drupal";

cd /var/www/project/web;

# Remove default html folder and symlink it to /var/www/project/web - drupal root
rm -rf /var/www/html/;
ln -s /var/www/project/web /var/www/html

# install drupal
drush site-install config_installer -y --keep-config \
--account-name=admin --account-pass=1234 --account-mail=admin@sweetbits.io

