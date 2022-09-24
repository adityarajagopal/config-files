#!/bin/bash

install_dir=~
repo_name=dotfiles
branch=main
repo=git@gitlab.com:m10824/dotfiles.git

function cloneRepo {
  [[ -d $install_dir/$repo_name ]] || \
    (cd $install_dir && git clone $repo && git checkout $branch)
}
export -f cloneRepo

function setupTmux {
  echo "Setting up tmux config ... "
  ln -sf $install_dir/$repo_name/.tmux.conf ~/.tmux.conf 
  ls -l ~/.tmux.conf
}
export -f setupTmux

function setupVim {
  echo "Setting up vim config ... "
  ln -sf $install_dir/$repo_name/nvim ~/.config/nvim
  ls -l ~/.config/nvim
  if [[ ! -d ~/.fzf ]]
  then 
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi
  nvim -c ":PlugInstall"
}
export -f setupVim

function setupI3 {
  echo "Setting up i3 config ... "
  ln -sf $install_dir/$repo_name/i3 ~/.config/i3/config
  ls -l ~/.config/i3/config
}
export -f setupI3

function setupBash {
  echo "Setting up bash config ... "
  source setup_bash.sh
}
export -f setupBash

function setupNix {
  echo "Setting up nix ... "
  source setup_nix.sh
}
export -f setupNix

cloneRepo
[[ $@ =~ 'v' ]] && setupVim
[[ $@ =~ 'i3' ]] && setupI3
[[ $@ =~ 'b' ]] && setupBash
[[ $@ =~ 't' ]] && setupTmux
[[ $@ =~ 'n' ]] && setupNix
