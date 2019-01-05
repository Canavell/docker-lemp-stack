!#/bin/bash
#type in command line: . ./setup.sh

#variables
export REMOTE_HOST_IP="$(echo $(hostname -I) | cut -d ' ' -f 1)"
export DEV_PATH="$(pwd)"

docker-compose down
docker-compose up -d --build

#mysql installing
while [ -z $(docker logs mysql 2>&1 | grep "mysqld: ready for connections") ]
do
    sleep 1
    echo "We are waiting for mysql to be ready."
done
if docker logs mysql 2>&1 | grep -Fxq "Initializing database"; then
  echo "We need to restart containers."
  docker-compose restart
fi



#install local scripts
for filename in ./local_tools/*; do
    yes | sudo cp -rf $filename /usr/local/bin/
    sudo chmod +x /usr/local/bin/$(basename "$filename")
done



#installing node js and npm
nodejs=$(dpkg-query -W --showformat='${Status}\n' nodejs|grep "install ok installed")
npm=$(dpkg-query -W --showformat='${Status}\n' npm|grep "install ok installed")
if [ "" == "$npm" -o "" == "$nodejs" ]; then
  echo "We need to install npm or nodejs"
  sudo apt-get update -y
  sudo apt-get install -y nodejs
  sudo apt-get install -y npm
fi
echo "Done"