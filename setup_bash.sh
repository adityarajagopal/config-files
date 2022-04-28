#!/bin/bash

ombroot=~/.oh-my-bash
if [[ ! -d $ombroot ]] 
then
  echo "Installing oh-my-bash ..."
  bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

echo "Setting theme to minimal ..."
sed -inE "s/OSH_THEME=.*/OSH_THEME=\"minimal\"/g" ~/.bashrc

grep "set -o vi" ~/.bashrc
if [[ $? != 0 ]] 
then 
  echo "Adding terminal vi command to .bashrc ..."
  echo "set -o vi" >> ~/.bashrc
fi

echo "Setting up aliases ..."
for aliasfile in $(ls aliases/)
do
  file=$(basename -- $aliasfile)
  ln -sf $file $ombroot/custom/aliases/$file
  ls -l $ombroot/custom/aliases/$file
done

source ~/.bashrc
