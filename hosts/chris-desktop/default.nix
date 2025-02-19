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

  # Touchpad support (enabled default in most desktopManager)
  # services.libinput.enable = true;

  system.stateVersion = "24.11";
}
