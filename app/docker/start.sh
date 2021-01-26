#!/bin/bash
chsh -s /bin/bash www-data
chmod +x /app/docker/install.sh
su www-data -s /app/docker/install.sh

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
