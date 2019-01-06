# nextcloud

- [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/pgollor) [![Docker Pulls](https://img.shields.io/docker/pulls/pgollor/nextcloud.svg)](https://hub.docker.com/r/pgollor/nextcloud/)
- app: [![Build Status](https://jenkins.pgollor.de/job/nextcloud-docker-app/badge/icon)](https://jenkins.pgollor.de/job/nextcloud-docker-app/) [![](https://images.microbadger.com/badges/image/pgollor/nextcloud:app-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:app-latest "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pgollor/nextcloud:app-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:app-latest "Get your own version badge on microbadger.com")
- web: [![Build Status](https://jenkins.pgollor.de/job/nextcloud-docker-web/badge/icon)](https://jenkins.pgollor.de/job/nextcloud-docker-web/) [![](https://images.microbadger.com/badges/image/pgollor/nextcloud:web-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:web-latest "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pgollor/nextcloud:web-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:web-latest "Get your own version badge on microbadger.com")

Docker compose files for nextcloud


## information

Get additional infos from https://hub.docker.com/_/nextcloud/ and from https://github.com/nextcloud/docker/tree/master/.examples .

## first start
```
mkdir data/data
chown www-data data/data
./generate_password.sh
```



## Licences

- nextcloud license: https://github.com/nextcloud/docker/blob/master/LICENSE.md
- [![cc-bc-sa](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
