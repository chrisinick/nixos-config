{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../system
    inputs.home-manager.nixosModules.default
  ];

  # Network
  networking.hostName = "chris-desktop";

  system.stateVersion = "24.11";
}
