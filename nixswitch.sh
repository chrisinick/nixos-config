#!/usr/bin/env bash
set -e
trap "git reset; exit 1" ERR
find . -name "*.nix" -exec nixfmt {} \;
git diff -U0 -- '*.nix'
echo "NixOS rebuilding..."
git add .
sudo nixos-rebuild switch --impure --flake .
commit_msg=$(nixos-rebuild list-generations --json | jq -r '
    .[] | select(.current == true) |
    "NixOS \(.nixosVersion) | kernel \(.kernelVersion) | \(.date)"
')
git commit -m "$commit_msg"
