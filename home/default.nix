{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./programs
    ./scripts
    ./gnome
  ];

  home.username = "chris";

  home.homeDirectory = "/home/chris";

  home.packages = with pkgs; [ ];

  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "$HOME/scripts:$PATH";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
