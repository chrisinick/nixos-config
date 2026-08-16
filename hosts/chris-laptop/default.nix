{
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "chris-laptop";

  disko.devices.disk.main.device = "/dev/disk/by-id/nvme-WDC_WDS500G2B0C-00PXH0_21375R468305";

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
