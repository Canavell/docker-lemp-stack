#!/usr/bin/env bash

sudo chmod -R gou+rwx ./logs
sudo chmod -R gou+rwx ./data
docker-compose down
docker-compose up -d --build

#mysql installing
while [ -z $(docker logs mysql 2>&1 | grep "mysqld: ready for connections") ]
do
    sleep 1
    echo "We are waiting for mysql to be ready."
done
if docker logs mysql 2>&1 | grep -Fxq "Initializing database"; then
  echo "Mysql inited."
fi

#mariadb installing
while [ -z $(docker logs mariadb 2>&1 | grep "mysqld: ready for connections") ]
do
    sleep 1
    echo "We are waiting for mariadb to be ready."
done
if docker logs mariadb 2>&1 | grep -Fxq "Initializing database"; then
  echo "Mariadb inited."
fi


#postgres installing
while [ -z $(docker logs postgres 2>&1 | grep "database system is ready to accept connections") ]
do
    sleep 1
    echo "We are waiting for postgres to be ready."
done
if docker logs postgres 2>&1 | grep -Fxq "The database cluster will be initialized"; then
  echo "Postgres inited."
fi

#install local scripts
for filename in ./local_tools/*; do
    yes | sudo cp -rf $filename /usr/local/bin/
    sudo chmod +x /usr/local/bin/$(basename "$filename")
done

echo "Done"