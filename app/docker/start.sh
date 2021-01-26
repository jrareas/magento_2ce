#!/bin/bash
chsh -s /bin/bash www-data

#su - www-data -c ./install.sh

# a2enmod mod_env
# a2ensite vhost
#chown -R www-data:www-data /var/www/magento/
#chmod 777 -R /var/www/magento/var
#chmod 777 -R /var/www/magento/generated
#chmod 777 -R /var/www/magento/app/etc

#php /var/www/magento/bin/magento module:enable --all
#php /var/www/magento/bin/magento setup:di:compile;

# exit # exit www-data user
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
