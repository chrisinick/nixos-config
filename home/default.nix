{
  config,
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

  # Secrets setup
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

  home.stateVersion = "26.05";
}
