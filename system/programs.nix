{
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      set -o vi
    '';
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
    '';
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
