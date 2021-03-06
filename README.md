# Nextcloud

- [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/pgollor) [![Docker Pulls](https://img.shields.io/docker/pulls/pgollor/nextcloud.svg)](https://hub.docker.com/r/pgollor/nextcloud/)
- app: [![Build Status](https://jenkins.pgollor.de/job/nextcloud-docker-app/badge/icon)](https://jenkins.pgollor.de/job/nextcloud-docker-app/) [![](https://images.microbadger.com/badges/image/pgollor/nextcloud:app-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:app-latest "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pgollor/nextcloud:app-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:app-latest "Get your own version badge on microbadger.com") [![based on nextcloud-version](https://img.shields.io/badge/dynamic/json.svg?label=based%20on&url=https%3A%2F%2Fapi.microbadger.com%2Fv1%2Fimages%2Fpgollor%2Fnextcloud%3Aapp-latest&query=%24.Labels.nv&colorB=brightgreen&prefix=nextcloud-)](https://hub.docker.com/_/nextcloud/)
- web: [![Build Status](https://jenkins.pgollor.de/job/nextcloud-docker-web/badge/icon)](https://jenkins.pgollor.de/job/nextcloud-docker-web/) [![](https://images.microbadger.com/badges/image/pgollor/nextcloud:web-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:web-latest "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pgollor/nextcloud:web-latest.svg)](https://microbadger.com/images/pgollor/nextcloud:web-latest "Get your own version badge on microbadger.com")

Docker compose files for nextcloud


## Information

Get additional infos from https://hub.docker.com/_/nextcloud/ and from https://github.com/nextcloud/docker/tree/master/.examples .

### occ Command
```
docker-compose exec --user www-data nextcloud-app php occ [command]
```

### Database

#### into db console
```
docker-compose exec nextcloud-database sh -c 'mysql -uroot -p"${MYSQL_ROOT_PASSWORD}"'
```

#### restore database from sql file
```
docker exec -i $(docker container ls -qf name=nextcloud-database) sh -c 'mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE}' < backup.sql
```


## Update hints

### 14.0.4 to 14.0.16

If you get a database error for the `activity` table, please have a look at this [issue](https://github.com/nextcloud/activity/issues/309#issuecomment-436929111).

## First start
```
mkdir data/data
chown www-data data/data
./generate_password.sh
```



## Licences

- nextcloud license: https://github.com/nextcloud/docker/blob/master/LICENSE.md
- [![cc-bc-sa](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
