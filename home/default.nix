{
  ...
}:
{
  imports = [
    ./programs
    ./scripts
  ];

  home.username = "chris";
  home.homeDirectory = "/home/chris";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "zeditor";
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };

  dconf = {
    enable = true;
    settings = {
      # Enable adw-gtk3 for cosmic
      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3";
      };
    };
  };

  home.stateVersion = "26.05";
}
