#!/bin/bash
chsh -s /bin/bash www-data

su www-data
/var/www/magento/bin/magento setup:install \
--base-url=http://$MAGENTO_HOST \
--db-host=$MAGENTO_DATABASE_HOST \
--db-name=$MAGENTO_DATABASE_NAME \
--db-user=$MAGENTO_DATABASE_USER \
--db-password=$MAGENTO_DATABASE_PASSWORD \
--admin-firstname=$MAGENTO_ADMIN_FIRST_NAME \
--admin-lastname=$MAGENTO_ADMIN_LAST_NAME \
--admin-email=$MAGENTO_ADMIN_EMAIL \
--admin-user=$MAGENTO_ADMIN_USER \
--admin-password=$MAGENTO_ADMIN_PASSWORD \
--currency=$MAGENTO_CURRENCY \
--timezone=$MAGENTO_TIMEZONE \
--use-rewrites=1 \
--elasticsearch-host=$ELASTICSEARCH_HOST \
--elasticsearch-port=$ELASTICSEARCH_PORT_NUMBER

# a2enmod mod_env
# a2ensite vhost
#chown -R www-data:www-data /var/www/magento/
#chmod 777 -R /var/www/magento/var
#chmod 777 -R /var/www/magento/generated
#chmod 777 -R /var/www/magento/app/etc

#php /var/www/magento/bin/magento module:enable --all
#php /var/www/magento/bin/magento setup:di:compile;

exit # exit www-data user
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
