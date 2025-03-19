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

  # Wifi (iwd)
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # auto-cpufreq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      energy_performance_preference = "performance";
      energy_perf_bias = "balance_performance";
      platform_profile = "performance";
      turbo = "auto";
    };
    battery = {
      governor = "powersave";
      energy_performance_preference = "power";
      energy_perf_bias = "balance_power";
      platform_profile = "low-power";
      turbo = "never";
    };
  };

  # Touchpad support
  services.libinput.enable = true;

  # Gnome performance balanced
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      chris.home.dconf.settings."org/gnome/shell".last-selected-power-profile = "balanced";
    };
  };

  system.stateVersion = "24.11";
}
