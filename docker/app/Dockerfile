FROM nextcloud:stable-fpm

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	smbclient libsmbclient-dev \
	libmagickwand-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN	pecl install \
	smbclient \
	imagick
RUN docker-php-ext-enable smbclient imagick

COPY redis.config.php /usr/src/nextcloud/config/redis.config.php
