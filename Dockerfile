FROM jrareas/php-7.3-apache-composer


RUN chown www-data:www-data /var/www


USER www-data

WORKDIR /var/www

RUN composer config --global http-basic.repo.magento.com e2771bf0f26485edc8bf85b0d7e04c60 704afc33054aecced4c96f592069ccc1
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento

WORKDIR /var/www/magento
RUN composer require magepow/categories
RUN bin/magento setup:upgrade
RUN bin/magento setup:static-content:deploy -f

USER root
RUN a2enmod rewrite

COPY ./app /app

COPY ./conf/supervisor/* /etc/supervisor/conf.d/
COPY ./conf/apache2/* /etc/apache2/sites-available/

RUN a2ensite vhost

RUN chmod +x /app/docker/start.sh


CMD "/app/docker/start.sh"
