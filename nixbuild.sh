#!/usr/bin/env bash
set -e
#alejandra .
git diff -U0 *.nix
echo "NixOS rebuilding..."
sudo nixos-rebuild switch --flake .#default
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"

