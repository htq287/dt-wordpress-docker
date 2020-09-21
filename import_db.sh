#!/bin/bash

# Start mysql service
docker-compose --log-level ERROR up -d example_com_db

# Load database name + root password
source .env

# Wait
while ! (docker-compose exec example_com_db /usr/bin/mysqladmin -u $MYSQL_USER --password=${MYSQL_ROOT_PASSWORD} ping --silent)
do
	sleep 3
	echo "Wait for DB to initialize"
done

# Restore
echo "Starting restore now."
cat $DB_BACKUP | docker-compose exec -T example_com_db \
	/usr/bin/mysql -u $MYSQL_USER --password=${MYSQL_ROOT_PASSWORD} ${DB_NAME}