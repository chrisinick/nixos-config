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
    ../../system
    inputs.home-manager.nixosModules.default
  ];

  # Network
  networking.hostName = "chris-laptop";

  # Wifi
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = true;

  # Wifi hotspot utility
  environment.systemPackages = with pkgs; [
    linux-wifi-hotspot
  ];

  # auto-cpufreq
  #services.power-profiles-daemon.enable = false;
  #services.auto-cpufreq.enable = true;
  #services.auto-cpufreq.settings = {
  #charger = {
  #governor = "performance";
  #energy_performance_preference = "performance";
  #energy_perf_bias = "balance_performance";
  #platform_profile = "performance";
  #turbo = "auto";
  #};
  #battery = {
  #governor = "powersave";
  #energy_performance_preference = "power";
  #energy_perf_bias = "balance_power";
  #platform_profile = "low-power";
  #turbo = "never";
  #};
  #};

  # Touchpad support
  services.libinput.enable = true;

  #home-manager = {
  #extraSpecialArgs = { inherit inputs; };
  #users = {
  #chris.home = {
  # Gnome performance balanced
  #dconf.settings."org/gnome/shell".last-selected-power-profile = "balanced";

  # Freetube quality setting
  #programs.freetube.settings.defaultQuality = "1080";
  #};
  #};
  #};

  system.stateVersion = "24.11";
}
