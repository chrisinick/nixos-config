{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Enabled programs
  programs.dconf.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.bash = {
    interactiveShellInit = ''
      set -o vi
    '';
  };
  programs.nautilus-open-any-terminal = {
    #enable = true;
    #terminal = "ghostty";
  };

  # Syncthing
  services.syncthing = {
    enable = true;
    group = "users";
    user = "chris";
    dataDir = "/home/chris";
    configDir = "/home/chris/.config/syncthing";
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
