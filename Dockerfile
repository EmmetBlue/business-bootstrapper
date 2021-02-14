FROM thecodingmachine/php:7.4-v4-apache
USER root
RUN apt-get update -yq && apt-get install -yq git curl g++ make unixodbc-dev zip unzip php-zip php7.4-dev php-pear && rm -rf /var/lib/apt/lists/*
ADD . /var/www/html/bootstrapper
RUN mkdir /var/www/html/condra-cloud /var/www/html/condra-cloud/globals /var/www/html/condra-cloud/api /var/www/html/condra-id /var/www/html/condra-admin
COPY apache_confs/vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY apache_confs/apache2.conf /etc/apache2/apache2.conf
COPY apache_confs/ports.conf /etc/apache2/ports.conf
RUN chown -R www-data:www-data /var/www/html && chmod -R g+rw /var/www/html
RUN pecl install sqlsrv && pecl install pdo_sqlsrv
RUN printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.4/mods-available/sqlsrv.ini
RUN printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.4/mods-available/pdo_sqlsrv.ini
RUN phpenmod -v 7.4 sqlsrv pdo_sqlsrv
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
# RUN apt-get update -yq --allow-unauthenticated --allow-insecure-repositories && ACCEPT_EULA=Y apt-get install -yq msodbcsql17  --allow-unauthenticated

EXPOSE 80 90 100 110