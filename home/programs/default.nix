{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.remmina.enable = true;

  programs.git = {
    enable = true;
    userName = "Christoph";
    userEmail = "72564159+chrisinick@users.noreply.github.com";
    extraConfig = {
      core = {
        editor = "vim";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };

  programs.vim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.vim-wayland-clipboard ];
    settings = {
      copyindent = true;
      expandtab = true;
      hidden = true;
      ignorecase = true;
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      smartcase = true;
    };
    extraConfig = ''
      set nocompatible
      set nobackup
      syntax enable
      set laststatus=2
      set shortmess+=I
      set backspace=indent,eol,start
      set incsearch
      nmap Q <Nop>
      set noerrorbells visualbell t_vb=
      set mouse+=a
      filetype plugin indent on
      if has("clipboard")
        set clipboard=unnamedplus
      endif
    '';
  };

  programs.freetube = {
    enable = true;
    settings = {
      barColor = false;
      checkForUpdates = false;
      defaultQuality = "1440";
      defaultViewingMode = "theatre";
      displayVideoPlayButton = false;
      expandSideBar = true;
      hideHeaderLogo = true;
      hideLabelsSideBar = false;
      mainColor = "Blue";
      region = "DE";
      rememberSearchHistory = false;
      sponsorBlockSelfPromo = {
        color = "Yellow";
        skip = "autoSkip";
      };
      uiScale = 120;
      unsubscriptionPopupStatus = true;
      useRssFeeds = true;
      useSponsorBlock = true;
    };
  };

  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      cursor-style = "block";
      shell-integration-features = "no-cursor";
      theme = "dark:Adwaita Dark,light:Adwaita";
    };
  };

  # programs.zed-editor = {
  # enable = true;
  # extraPackages = with pkgs; [
  # nixd
  # nil
  # nixfmt-rfc-style
  # package-version-server
  # ];
  # extensions = [
  # "html"
  # "toml"
  # "git-firefly"
  # "basher"
  # "nix"
  # ];
  # userSettings = {
  # telemetry = {
  # metrics = false;
  # diagnostics = false;
  # };
  # features = {
  # copilot = false;
  # };
  # journal = {
  # hour_format = "hour24";
  # };
  # calls = {
  # mute_on_join = true;
  # };
  # ui_font_size = 20;
  # ui_font_weight = 500;
  # buffer_font_size = 20;
  # buffer_font_weight = 500;
  # inlay_hints = {
  # enabled = true;
  # };
  # format_on_save = "on";
  # vim_mode = true;
  # vim = {
  # toggle_relative_line_numbers = true;
  # use_system_clipboard = "always";
  # use_multiline_find = true;
  # use_smartcase_find = true;
  # };
  # load_direnv = "shell_hook";
  # base_keymap = "VSCode";
  # assistant = {
  # default_model = {
  # provider = "zed.dev";
  # model = "claude-3-5-sonnet-latest";
  # };
  # version = "2";
  # };
  # lsp = {
  # rust-analyzer = {
  # binary = {
  # path = "/run/current-system/sw/bin/rust-analyzer";
  # };
  # initialization_options = {
  # check = {
  # command = "clippy";
  # };
  # };
  # };
  # package-version-server = {
  # binary = {
  # path = "/run/current-system/sw/bin/package-version-server";
  # };
  # };
  # };
  # languages = {
  # Nix = {
  # language_servers = [
  # "nil"
  # "!nixd"
  # ];
  # formatter = {
  # external = {
  # command = "nixfmt";
  # };
  # };
  # };
  # };
  # };
  # };
}
