{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./freetube.nix
    ./ghostty.nix
    ./git.nix
    ./vim.nix
    ./zed-editor.nix
  ];

  services.remmina.enable = true;
}
