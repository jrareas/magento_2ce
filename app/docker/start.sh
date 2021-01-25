#!/bin/bash

# add MAGENTO_HOST to your hosts file if not a FQDN

su www-data -c /var/www/magento/bin/magento setup:install \
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

 /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
