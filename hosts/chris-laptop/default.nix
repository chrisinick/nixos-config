{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/laptop.nix
  ];

  # Network
  networking.hostName = "chris-laptop";

  system.stateVersion = "24.11";
}
