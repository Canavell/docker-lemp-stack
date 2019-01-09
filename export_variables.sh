#!/usr/bin/env bash
#variables
variablesList=".dockerStackVariablesList"

if [ -f ~/$variablesList ] ; then
    rm ~/$variablesList
fi
touch ~/$variablesList

echo "export REMOTE_HOST_IP=\"$(echo $(hostname -I) | cut -d ' ' -f 1)\"" >> ~/$variablesList
echo "export DEV_PATH=\"$(pwd)\"" >> ~/$variablesList

if ! grep -q "source ~/$variablesList" ~/.bashrc; then
  echo "source ~/$variablesList" >> ~/.bashrc
fi