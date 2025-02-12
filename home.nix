{ config, pkgs, ... }:

{
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "gnome-text-editor.desktop" ];
    "application/pdf" = [ "papers.desktop" ];
    "image/*" = [ "loupe.desktop" ];
    "video/png" = [ "loupe.desktop" ];
    "video/jpg" = [ "loupe.desktop" ];
    "video/*" = [ "clapper.desktop" ];
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Christoph";
    userEmail = "72564159+chrisinick@users.noreply.github.com";
    extraConfig = {
      core = { editor = "vim"; };
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
    };
  };

  home.stateVersion = "24.11";

}
