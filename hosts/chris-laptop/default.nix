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
  disko.devices.lvm_vg.pool.lvs.swap.size = "64G";

  system.stateVersion = "26.05";

  # Hardware
  hardware.framework.enableKmod = true;

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

  # Power management
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;

  # Closing the lid
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };
  # Suspend then hibernate
  systemd.services."systemd-suspend-then-hibernate".aliases = [ "systemd-suspend.service" ];

  # Fingerprint scanner
  services.fprintd.enable = true;

  # Touchpad support
  services.libinput.enable = true;

  # Sound profile
  home-manager.users.chris.imports = [ ./easyeffects.nix ];
}
