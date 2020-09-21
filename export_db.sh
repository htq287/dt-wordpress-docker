#!/bin/bash

# Change to the script's directory & create directory
cd $(dirname "$(readlink -f "$0")")
mkdir -p ./src/data

# Start mysql service
docker-compose --log-level ERROR up -d example_com_db

# Load database name + root password
source .env

# Wait

echo ${MYSQL_USER}
echo ${MYSQL_ROOT_PASSWORD}
echo ${DB_NAME}

# Delete old Backups
find ./src/data/* -atime +7 -exec rm {} \;

docker-compose exec -T example_com_db /usr/bin/mysqldump -u ${MYSQL_USER} --password=${MYSQL_ROOT_PASSWORD} ${DB_NAME} > ./src/data/`date +\%Y\%m\%d`-${DB_NAME}.sql