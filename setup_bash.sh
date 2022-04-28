#!/bin/bash

if [[ ! -d ~/.oh-my-bash ]] 
then
  echo "Installing oh-my-bash ..."
  bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

echo "Setting theme to minimal ..."
sed -inE "s/OSH_THEME=.*/OSH_THEME=\"minimal\"/g" ~/.bashrc

echo "Adding terminal vi command to .bashrc"
echo "set -o vi" >> ~/.bashrc

source ~/.bashrc
