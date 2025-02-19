#!/usr/bin/env bash
set -e
trap "git reset; exit 1" ERR
find . -name "*.nix" -exec nixfmt {} \;
git diff -U0 *.nix
echo "NixOS rebuilding..."
git add .
sudo nixos-rebuild switch --flake .
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"

