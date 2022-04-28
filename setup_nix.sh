#!/bin/bash

nixversion=$(nix-env --version)
if [[ $? != 0 ]]
then
  echo "Installing Nix"
  [[ uname == "Darwin" ]] \
    && sh <(curl -kL https://nixos.org/nix/install) \
    || sh <(curl -kL https://nixos.org/nix/install) --daemon 
fi
echo "Installed Nix version: $(nix-env --version)"




