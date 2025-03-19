{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./gnome.nix
    ./vpn.nix
  ];
  home.file = {
    # ideapadmode
    "scripts/ideapadmode.sh" = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/chrisinick/ideapad-mode/master/ideapadmode.sh";
        sha256 = "sha256-+QRu8DfhjX07FPwU/HXvFEPGmNsrQRLgk8q/qX82WsQ=";
      };
      executable = true;
    };
  };
}
