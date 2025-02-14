{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper-uri = "file:///home/chris/vault/sync/bilder/wallpapers/snow_forest.jpg";
in {
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  home.packages = with pkgs; [
  ];

  home.file = {
    # Sort Gnome app grid
    ".config/autostart/sort-app-grid.desktop" = {
      text = ''
        [Desktop Entry]
        Name=SortAppGrid
        Type=Application
        Comment=Sorts the Gnome app grid alphabetically
        Exec=${pkgs.bash}/bin/bash -c "gsettings set org.gnome.shell app-picker-layout "[]""
        Terminal=false
        X-GNOME-Autostart-enabled=true
      '';
    };

    # Nautilus context menu: Compress mulithreaded
    ".local/share/nautilus/scripts/compress_multithreaded.sh" = {
      text = ''
        #!/usr/bin/env bash
        FILE="$1"
        tar -I 'xz -T0' -cf "$FILE.tar.xz" "$FILE"
        notify-send "Compression complete" "Compressed $FILE using multithreading."
      '';
      executable = true;
    };

    # Nautilus context menu: Decompress mulithreaded
    ".local/share/nautilus/scripts/decompress_multithreaded.sh" = {
      text = ''
        #!/usr/bin/env bash
        FILE="$1"
        if [[ "$FILE" == *.xz && "$FILE" != *.tar.xz ]]; then
            xz -d -T0 "$FILE"
            notify-send "Decompression Complete" "Decompressed $FILE using multithreading."
        elif [[ "$FILE" == *.tar.xz ]]; then
            tar --use-compress-program='xz -T0' -xvf "$FILE"
            notify-send "Extraction Complete" "Extracted $FILE using multithreading."
        else
            notify-send "Error" "Selected file is not a valid .xz or .tar.xz archive."
            exit 1
        fi
      '';
      executable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Gnome settings
  dconf = {
    enable = true;
    settings = {
      # Power
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
      };
      "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;

      # Interface
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
        color-scheme = "prefer-light";
        enable-hot-corners = false;
        show-battery-percentage = true;
        text-scaling-factor = 1.20;
        gtk-theme = "adw-gtk3";
      };
      "org/gnome/desktop/calendar".show-weekdate = true;
      "org/gnome/desktop/datetime".automatic-timezone = true;
      "org/gnome/mutter".center-new-windows = true;

      # Wallpaper TODO
      "org/gnome/desktop/background" = {
        picture-uri = wallpaper-uri;
        picture-uri-dark = wallpaper-uri;
      };
      "org/gnome/desktop/screensaver".picture-uri = wallpaper-uri;

      # Default apps
      "org/gnome/desktop/default-applications/office/calendar".exec = "evolution -c calendar";
      "org/gnome/desktop/default-applications/office/calendar".needs-term = false;
      "org/gnome/desktop/default-applications/office/tasks".exec = "evolution -c tasks";
      "org/gnome/desktop/default-applications/office/tasks".needs-term = false;
      "org/gnome/desktop/default-applications/terminal".exec = "ghostty";
      "org/gnome/desktop/default-applications/terminal".exec-arg = "";

      # Peripherals
      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
        speed = -0.20;
      };

      # Privacy
      "org/gnome/desktop/privacy" = {
        recent-files-max-age = 30;
        remember-recent-files = false;
        remove-old-temp-files = true;
        remove-old-trash-files = true;
      };

      # Printing
      "org/gnome/desktop/lockdown" = {
        disable-print-setup = true;
        disable-printing = true;
      };

      # Sound
      "org/gnome/desktop/sound" = {
        event-sounds = false;
        input-feedback-sounds = false;
      };
      "org/gnome/desktop/wm/preferences" = {
        audible-bell = false;
      };

      # Shell settings
      "org/gnome/shell" = {
        allow-extension-installation = false;
        disable-user-extensions = true;
        favorite-apps = [
          "firefox.desktop"
          "thunderbird.desktop"
          "com.mitchellh.ghostty.desktop"
          "org.gnome.Nautilus.desktop"
          "startcenter.desktop"
          "obsidian.desktop"
          "dev.zed.Zed.desktop"
          "org.gnome.TextEditor.desktop"
        ];
        last-selected-power-profile = "performance";
        automatic-location = false;
      };

      # Keybindings
      "org/gnome/desktop/wm/keybindings" = {
        maximize = ["<Super>Up"];
        move-to-monitor-down = ["<Super><Shift>Down"];
        move-to-monitor-left = ["<Shift><Super>Left"];
        move-to-monitor-right = ["<Super><Shift>Right"];
        move-to-monitor-up = ["<Super><Shift>Up"];
        move-to-workspace-1 = ["<Alt><Super>1"];
        move-to-workspace-2 = ["<Alt><Super>2"];
        move-to-workspace-3 = ["<Alt><Super>3"];
        move-to-workspace-4 = ["<Alt><Super>4"];
        move-to-workspace-5 = ["<Alt><Super>5"];
        move-to-workspace-6 = ["<Alt><Super>6"];
        move-to-workspace-7 = ["<Alt><Super>7"];
        move-to-workspace-8 = ["<Alt><Super>8"];
        move-to-workspace-9 = ["<Alt><Super>9"];
        move-to-workspace-10 = ["<Alt><Super>0"];
        move-to-workspace-last = ["<Alt><Super>ssharp"];
        move-to-workspace-up = ["<Alt><Super>Up"];
        move-to-workspace-down = ["<Alt><Super>Down"];
        move-to-workspace-left = ["<Alt><Super>Left"];
        move-to-workspace-right = ["<Alt><Super>Right"];
        switch-to-workspace-1 = ["<Primary><Super>1"];
        switch-to-workspace-2 = ["<Primary><Super>2"];
        switch-to-workspace-3 = ["<Primary><Super>3"];
        switch-to-workspace-4 = ["<Primary><Super>4"];
        switch-to-workspace-5 = ["<Primary><Super>5"];
        switch-to-workspace-6 = ["<Primary><Super>6"];
        switch-to-workspace-7 = ["<Primary><Super>7"];
        switch-to-workspace-8 = ["<Primary><Super>8"];
        switch-to-workspace-9 = ["<Primary><Super>9"];
        switch-to-workspace-10 = ["<Primary><Super>0"];
        switch-to-workspace-last = ["<Primary><Super>ssharp"];
        switch-to-workspace-up = ["<Primary><Super>Up"];
        switch-to-workspace-down = ["<Primary><Super>Down"];
        switch-to-workspace-left = ["<Primary><Super>Left"];
        switch-to-workspace-right = ["<Primary><Super>Right"];
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita";
  };

  # Programs
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Christoph";
    userEmail = "72564159+chrisinick@users.noreply.github.com";
    extraConfig = {
      core = {editor = "vim";};
      init = {defaultBranch = "main";};
      push = {autoSetupRemote = true;};
    };
  };

  programs.vim = {
    enable = true;
    plugins = [pkgs.vimPlugins.vim-wayland-clipboard];
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
      theme = "Adwaita";
    };
  };

  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "toml"
      "git-firefly"
      "basher"
    ];
    userSettings = {
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      features = {
        copilot = false;
      };
      journal = {
        hour_format = "hour24";
      };
      calls = {
        mute_on_join = true;
      };
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "Ayu Dark";
      };
      ui_font_size = 20;
      ui_font_weight = 500;
      buffer_font_size = 20;
      buffer_font_weight = 500;
      inlay_hints = {
        enabled = true;
      };
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
        use_multiline_find = true;
        use_smartcase_find = true;
      };
      assistant = {
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };
        version = "2";
      };
      lsp = {
        rust-analyzer = {
          initialization_options = {
            check = {command = "clippy";};
          };
        };
      };
    };
  };

  home.stateVersion = "24.11";
}
