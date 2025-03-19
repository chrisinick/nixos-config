{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      cursor-style = "block";
      shell-integration-features = "no-cursor";
      theme = "dark:Adwaita Dark,light:Adwaita";
    };
  };
}
