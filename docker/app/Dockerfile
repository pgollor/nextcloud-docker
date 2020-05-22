FROM nextcloud:19-rc-fpm

ARG NV
ARG VCS_REF

LABEL org.label-schema.vcs-url="https://gitbucket.pgollor.de/docker/nextcloud" \
	org.label-schema.vcs-ref=$VCS_REF \
	nv=$NV

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	libgmp3-dev \
	smbclient libsmbclient-dev \
	libbz2-dev \
	libmagickcore-6.q16-6-extra \
	php-bcmath
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN	pecl install \
	smbclient
RUN docker-php-ext-install bz2
RUN docker-php-ext-install gmp
RUN docker-php-ext-install bz2
RUN docker-php-ext-enable smbclient

COPY redis.config.php /usr/src/nextcloud/config/redis.config.php
