{
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../system
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "chris-desktop";

  system.stateVersion = "26.05";
}
