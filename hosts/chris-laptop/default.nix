{
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.framework-intel-core-ultra-series3
    ./hardware-configuration.nix
    ../../system
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/nvme-WDC_WDS500G2B0C-00PXH0_21375R468305";
  system.stateVersion = "26.05";

  # Network
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    Network.EnableIPv6 = true;
    Settings.AutoConnect = true;
    Settings.AddressRandomization = "enabled";
  };
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi = {
    backend = "iwd";
    powersave = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Battery management
  services.power-profiles-daemon.enable = true;

  # Touchpad support
  services.libinput.enable = true;
}
