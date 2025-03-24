{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      p: with p; [
        rustup
        zlib
        openssl.dev
        pkg-config
      ]
    );
  };
}
