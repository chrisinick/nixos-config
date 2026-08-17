{
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./freetube.nix
    ./ghostty.nix
    ./git.nix
    ./rclone.nix
    ./vim.nix
    ./vscode.nix
    ./zathura.nix
    ./zed-editor.nix
  ];

  programs.discord.enable = true;
  services.remmina.enable = true;
}
