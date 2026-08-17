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

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "zeditor";
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.stateVersion = "26.05";
}
