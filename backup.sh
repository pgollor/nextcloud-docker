#!/bin/bash


# backup directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
backupDir=${SCRIPT_DIR}/backup

# create directories
mkdir -p ${backupDir}/app
mkdir -p ${backupDir}/docker-conf
mkdir -p ${backupDir}/data
mkdir -p ${backupDir}/db

# current date
currentDate=$(date +"%Y-%m-%d_%H-%M-%S")

# backup mysql
dbFile="${backupDir}/db/${currentDate}.sql"
docker exec $(docker container ls -qf name=nextcloud-database) sh -c 'mysqldump --single-transaction=TRUE --lock-tables --default-character-set=utf8mb4 -uroot -p"${MYSQL_ROOT_PASSWORD}" ${MYSQL_DATABASE}' > ${dbFile}
sed -i "/^mysqldump: \\[Warning\\]/d" ${dbFile}
tar -cj ${dbFile} -f "${dbFile}.tbz2"
rm ${dbFile}

# backup app data as root because of permission problems
sudo tar -C data -I pbzip2 -pc app -f "${backupDir}/app/${currentDate}.tbz2"

# backup data as root because of permission problems
#sudo tar -C data -I pbzip2 -pc data -f "${backupDir}/data/${currentDate}.tbz2"

# backup config files
tar -pcj nextcloud.conf -f "${backupDir}/docker-conf/${currentDate}.tbz2"

# delete all files older 30 days
find ${backupDir} -iname "*.tbz2" -type f -mtime +10 -exec rm {} \; > /dev/null
