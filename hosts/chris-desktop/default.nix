{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  disko.devices.disk.main.device = "/dev/disk/by-id/nvme-WD_PC_SN740_SDDPTQE-2T00_23091G802429";
  system.stateVersion = "26.05";

  # Network
  systemd.network = {
    enable = true;
    networks."10-wired" = {
      matchConfig.Name = "en*";
      networkConfig.DHCP = "yes";
    };
  };
}
