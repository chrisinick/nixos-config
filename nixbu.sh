#!/bin/bash
set -e
alejandra . &>/dev/null
git diff -U0 *.nix
echo "NixOS rebuilding..."
sudo nixos-rebuild switch --flake .#default &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"

