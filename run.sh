#!/bin/bash

# Install nix
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# Install nix darwin
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cp ./* /etc/nix-darwin
cd /etc/nix-darwin
sed -i '' "s/host_name/$(scutil --get LocalHostName)/" flake.nix
sudo nix run nix-darwin/master#darwin-rebuild -- switch
