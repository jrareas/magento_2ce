#!/bin/bash

/var/www/magento/bin/magento setup:install \
--base-url=https://$MAGENTO_HOST \
--db-host=$MAGENTO_DATABASE_HOST \
--db-name=$MAGENTO_DATABASE_NAME \
--db-user=$MAGENTO_DATABASE_USER \
--db-password=$MAGENTO_DATABASE_PASSWORD \
--backend-frontname=$MAGENTO_ADMIN_URI \
--admin-firstname=$MAGENTO_ADMIN_FIRST_NAME \
--admin-lastname=$MAGENTO_ADMIN_LAST_NAME \
--admin-email=$MAGENTO_ADMIN_EMAIL \
--admin-user=$MAGENTO_ADMIN_USER \
--admin-password=$MAGENTO_ADMIN_PASSWORD \
--currency=$MAGENTO_CURRENCY \
--timezone=$MAGENTO_TIMEZONE \
--use-rewrites=1 \
--elasticsearch-host=$ELASTICSEARCH_HOST \
--elasticsearch-port=$ELASTICSEARCH_PORT_NUMBER \
--elasticsearch-index-prefix=$ELASTICSEARCH_INDEX_PREFIX

/var/www/magento/bin/magento module:disable Magento_TwoFactorAuth
