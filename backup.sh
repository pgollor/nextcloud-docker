#!/bin/bash


# backup directory
backupDir=$PWD/backup
mkdir -p ${backupDir}
mkdir -p ${backupDir}/app
mkdir -p ${backupDir}/conf
mkdir -p ${backupDir}/data
mkdir -p ${backupDir}/db

# current date
currentDate=$(date +"%Y-%m-%d_%H-%M-%S")

# backup mysql
dbFile="${backupDir}/db/${currentDate}.sql"
docker-compose exec nextcloud-database sh -c 'mysqldump --lock-tables --default-character-set=utf8mb4 -uroot -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE}' > ${dbFile}
sed -i "/^mysqldump: \\[Warning\\]/d" ${dbFile}
tar -cj ${dbFile} -f "${dbFile}.tbz2"
rm ${dbFile}

# backup app data as root because of permissions
sudo tar -C data --exclude=app/data -pcj app -f "${backupDir}/app/${currentDate}.tbz2"

# backup data as root because of permissions
sudo tar -C data -pcj app/data -f "${backupDir}/data/${currentDate}.tbz2"

# backup config files
tar -pcj data/conf nextcloud.conf -f "${backupDir}/conf/${currentDate}.tbz2"

# delete all files older 30 days
find ${backupDir} -iname "*.tbz2" -type f -mtime +10 -exec rm {} \; > /dev/null
