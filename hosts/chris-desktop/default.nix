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
  systemd.network = {
    enable = true;
    networks."10-wired" = {
      matchConfig.Name = "en*";
      networkConfig.DHCP = "yes";
    };
  };
  services.resolved.enable = true;

  system.stateVersion = "24.11";
}
