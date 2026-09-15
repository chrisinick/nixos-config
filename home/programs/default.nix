{
  ...
}:
{
  imports = [
    ./firefox
    ./freetube.nix
    ./git.nix
    ./remmina.nix
    ./rclone.nix
    ./vim.nix
    ./zathura.nix
    ./zed-editor.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.discord.enable = true;
}
