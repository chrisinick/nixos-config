{
  ...
}:
{
  home.file = {
    # ideapadmode
    ".local/bin/ideapadmode" = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/chrisinick/ideapad-mode/master/ideapadmode.sh";
        sha256 = "sha256-+QRu8DfhjX07FPwU/HXvFEPGmNsrQRLgk8q/qX82WsQ=";
      };
      executable = true;
    };
  };
}
