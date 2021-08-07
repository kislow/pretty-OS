#!/bin/bash

code_version=$(code --version | awk '{print $1; exit}')
jq_version=$(jq --version)

if [[ $code_version =~ "not found" ]] || [[ $code_version -ne 0 ]]; then
  # Update packages and install dependencies
  sudo apt update -y && apt install software-properties-common apt-transport-https wget
  #import the Microsoft GPG key
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  # enable vscode repo
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  # Install latest vscode version
  sudo apt update -y && apt install code

  if [ $jq_version -ne 0 ]; then
    echo "Installing jq..."
    sudo apt update -y && apt install jq -y
  else
    continue
  fi

else
  echo "VSCode version $code_version installed"
  echo "jq version $jq_version installed"
fi

#install extensions and set theme to default
code --install-extension divola.ayu-dark-lighter --force
jq '."workbench.colorTheme" = "Ayu Dark Lighter"' ~/.config/Code/User/settings.json > tmp.$$.json &&  mv -f tmp.$$.json ~/.config/Code/User/settings.json
echo "Restart VSCode for changes to take effect!"

