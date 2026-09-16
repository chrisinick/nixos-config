{
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.bat.enable = true;
  programs.git.enable = true;

  fonts.fontconfig.useEmbeddedBitmaps = true; # for emojis in firefox

  programs.bash.interactiveShellInit = ''
    if [[ -t 1 ]] \
       && [[ -z "$IN_NIX_SHELL" ]] \
       && [[ $(</proc/$PPID/comm) != "fish" ]] \
       && (( SHLVL <= 2 )) \
       && command -v fish >/dev/null
    then
      shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
      exec fish $LOGIN_OPTION
    fi
  '';

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_add_path $HOME/.local/bin
    '';
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
    '';
    shellAliases = {
      "grep" = "rg";
      "find" = "fd";
      "cat" = "bat --paging=never";
      "ls" = "eza";
      "git-graph" = "git log --oneline --graph --decorate";
    };
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    extraPackages = with pkgs; [ cosmic-icons ];
  };
  environment.sessionVariables.PROTON_ENABLE_WAYLAND = "1";
}
