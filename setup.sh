!#/bin/bash
#type in command line: . ./setup.sh

#variables
export REMOTE_HOST_IP="$(echo $(hostname -I) | cut -d ' ' -f 1)"
export DEV_PATH="$(pwd)"

sudo chmod -R gou+rwx .
docker-compose down
docker-compose up -d --build

#mysql installing
rm mysql-setup-log.txt 
docker logs mysql >& mysql-setup-log.txt 
while [ -z $(grep "mysqld: ready for connections" mysql-setup-log.txt) ]
do
    sleep 1
    docker logs mysql >& mysql-setup-log.txt 
    echo "We are waiting for mysql to be initialized."
done
rm mysql-setup-log.txt 
docker-compose restart

#install local scripts
for filename in ./local_tools/*; do
    yes | sudo cp -rf $filename /usr/local/bin/
    sudo chmod +x /usr/local/bin/$(basename "$filename")
done