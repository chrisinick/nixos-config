{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./freetube.nix
    ./ghostty.nix
    ./git.nix
    ./vim.nix
    ./vscode.nix
    ./zed-editor.nix
  ];

  services.remmina.enable = true;

  programs.zathura = {
    enable = true;
    options = {
      synctex = true;
      "synctex-editor-command" = "/run/current-system/sw/bin/zeditor %{input}:%{line}";
    };
  };
}
