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

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
    nix-output-monitor.enable = true;
  };

  programs.discord.enable = true;
}
