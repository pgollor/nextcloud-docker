FROM nextcloud:fpm

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		smbclient libsmbclient-dev
RUN	pecl install \
		smbclient
RUN rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-enable smbclient

COPY redis.config.php /usr/src/nextcloud/config/redis.config.php
