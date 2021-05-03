#!/bin/bash

vscode=$(code --version | awk '{print $1; exit}')
code_version=$?
if [ $code_version -eq 0 ]; then
    echo "VSCode version $vscode installed"
else
  # Update packages and install dependencies
  sudo apt update -y && apt install software-properties-common apt-transport-https wget
  #import the Microsoft GPG key
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  # enable vscode repo
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  # Install latest vscode version
  sudo apt update -y && apt install code
fi

#install extensions
cat ./src/extensions.txt | while read extension || [[ -n $extension ]];
do
  code --install-extension $extension --force
done
