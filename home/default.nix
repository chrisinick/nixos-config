{
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

  programs.home-manager.enable = true;
  #home.packages = with pkgs; [ ];

  home.sessionVariables.EDITOR = "vim";

  home.stateVersion = "26.05";
}
