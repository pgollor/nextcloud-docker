FROM nextcloud:16-fpm

ARG NV
ARG VCS_REF

LABEL org.label-schema.vcs-url="https://gitbucket.pgollor.de/docker/nextcloud" \
	org.label-schema.vcs-ref=$VCS_REF \
	nv=$NV

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	smbclient libsmbclient-dev \
	libbz2-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN	pecl install \
	smbclient
RUN docker-php-ext-install bz2
RUN docker-php-ext-enable smbclient

COPY redis.config.php /usr/src/nextcloud/config/redis.config.php
