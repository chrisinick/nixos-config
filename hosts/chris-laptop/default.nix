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

  networking.hostName = "chris-laptop";

  system.stateVersion = "26.05";

  # Wifi
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    Network.EnableIPv6 = true;
    Settings.AutoConnect = true;
    Settings.AddressRandomization = "enabled";
  };
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi = {
    powersave = true;
    backend = "iwd";
  };

  # Battery management
  services.power-profiles-daemon.enable = true;

  # Touchpad support
  services.libinput.enable = true;
}
