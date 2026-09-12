{
  ...
}:
{
  imports = [
    ./firefox
    ./freetube.nix
    ./ghostty.nix
    ./git.nix
    ./remmina.nix
    ./rclone.nix
    ./vim.nix
    ./vscode.nix
    ./zathura.nix
    ./zed-editor.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.discord.enable = true;
}
