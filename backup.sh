#!/bin/bash


# backup directory
backupDir=./backup
mkdir -p ${backupDir}
mkdir -p ${backupDir}/cloud
mkdir -p ${backupDir}/conf
mkdir -p ${backupDir}/db

# current date
currentDate=$(date +"%Y-%m-%d_%H-%M-%S")


# backup mysql
dbFile="${backupDir}/db/${currentDate}.sql"
docker-compose exec nextcloud-database sh -c 'exec mysqldump --lock-tables --default-character-set=utf8mb4 -uroot -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE}' > ${dbFile}
sed -i "/^mysqldump: \\[Warning\\]/d" ${dbFile}
tar -cj ${dbFile} -f "${dbFile}.tbz2"
rm ${dbFile}

# backup repositories
tar -cj data/cloud nextcloud.conf -f "${backupDir}/cloud/${currentDate}.tbz2"

# backup config files
tar -cj data/conf -f "${backupDir}/conf/${currentDate}.tbz2"

# delete all files older 30 days
#find ${backupDir} -iname "*.tbz2" -type f -mtime +10 -exec rm {} \; > /dev/null
