{
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.git.enable = true;
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];
    policies = {
      DisableTelemetry = true;
      CrashReportsSubmit.Enabled = false;
    };
  };
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
