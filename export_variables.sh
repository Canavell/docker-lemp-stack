#!/usr/bin/env bash
#variables
variablesList=".dockerStackVariablesList"

if [ -f $variablesList ] ; then
    rm ~/$variablesList
fi
touch ~/$variablesList

echo "export REMOTE_HOST_IP=\"$(echo $(hostname -I) | cut -d ' ' -f 1)\"" >> ~/$variablesList
echo "export DEV_PATH=\"$(pwd)\"" >> ~/$variablesList
echo "export user_uid=\"$(id -u)\"" >> ~/$variablesList
echo "export user_gid=\"$(id -g)\"" >> ~/$variablesList

if ! grep -q "source ~/.dockerStackVariablesList" ~/.bashrc; then
  echo "source ~/.dockerStackVariablesList" >> ~/.bashrc
fi