# nextcloud

docker compose for https://github.com/nextcloud/docker/

## first start
```
mkdir data/data
chown www-data data/data
```

## troubleshooting


### mariadb update

message:

```
[Warning] InnoDB: Table mysql/innodb_table_stats has length mismatch in the column name table_name. Please run mysql_upgrade
```

solution:

```
source nextcloud.conf
docker-compose exec nextcloud-database sh -c 'mysql_upgrade -uroot -p${NEXTCLOUD_DATABASE_ROOT}'
```
