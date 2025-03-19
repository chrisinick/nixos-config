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
    ../../modules/system.nix
    inputs.home-manager.nixosModules.default
  ];

  # Network
  networking.hostName = "chris-desktop";

  system.stateVersion = "24.11";
}
