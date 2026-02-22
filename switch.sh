#!/bin/bash

sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cp -R ./* /etc/nix-darwin
cd /etc/nix-darwin
sed -i '' "s/host_name/$(scutil --get LocalHostName)/" flake.nix
sudo nix --extra-experimental-features nix-command --extra-experimental-features flakes  run nix-darwin/master#darwin-rebuild -- switch
