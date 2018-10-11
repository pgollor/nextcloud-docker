# nextcloud

docker compose files for https://github.com/nextcloud/docker/

## 2018-10-11
Do not update. Have a look at `DO_NOT-UPDATE.md` for further information.

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
docker-compose exec nextcloud-database sh -c 'mysql_upgrade -uroot -p${MYSQL_ROOT_PASSWORD}'
```
