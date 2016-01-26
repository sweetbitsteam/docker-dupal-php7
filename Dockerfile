FROM php:7.0.1-apache
MAINTAINER Otar Zakalashvili <oto.zakalashvili@gmail.com>

RUN a2enmod rewrite


# install the PHP extensions we need and mysql-client
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev mysql-client \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip


# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# install Git
RUN apt-get install git -y

# install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && export PATH="$HOME/.composer/vendor/bin:$PATH" 

# install Drush
RUN curl -0 http://files.drush.org/drush.phar > drush && chmod +x drush && mv drush /usr/local/bin/drush && drush core-status


# install Drupal Console
RUN curl -L -0 https://github.com/hechoendrupal/DrupalConsole/releases/download/0.10.0/drupal.phar > drupal && chmod +x drupal && mv drupal /usr/local/bin/drupal && drupal --version


# Copy over project specific setup script
COPY setup.sh /usr/local/bin/setup
RUN chmod +x /usr/local/bin/setup





WORKDIR /var/www/project