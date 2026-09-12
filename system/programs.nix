{
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.git.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true; # for emojis in firefox
  programs.thunderbird.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      set -o vi
    '';
  };
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_add_path $HOME/.local/bin
    '';
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      ${pkgs.fastfetch}/bin/fastfetch
    '';
    shellAliases = {
      "grep" = "rg";
      "find" = "fd";
      "cat" = "bat";
      "ls" = "eza";
      "git graph" = "git log --oneline --graph --decorate";
    };
  };
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.bat.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
  programs.vscode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
