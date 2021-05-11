#!/bin/sh

#            _                 _      
#  _ __ ___ | |__  _ __  _ __ (_)_  __
# | '_ ` _ \| '_ \| '_ \| '_ \| \ \/ /
# | | | | | | |_) | |_) | | | | |>  < 
# |_| |_| |_|_.__/| .__/|_| |_|_/_/\_\
#                 |_|                 

# GitHub: https://github.com/mbpnix2105

pushd ../
sudo nixos-rebuild switch --flake .#nixos -L
popd

