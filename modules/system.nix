{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # systemd-boot EFI boot loader
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 4;
    };
    efi.canTouchEfiVariables = true;
    timeout = 2;
  };

  # Time zone
  time.timeZone = "Europe/Berlin";

  # Internationalisation
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  # Hardware settings
  hardware.graphics.enable = true;

  # Network
  systemd.network = {
    enable = true;
    networks."10-wired" = {
      matchConfig.Name = "en*";
      networkConfig.DHCP = "yes";
    };
  };
  services.resolved.enable = true;

  # X11, Wayland, Gnome
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    # Keymap in X11 and Wayland
    xkb.layout = "de";
    xkb.options = "caps:escape";
  };
  services.displayManager.defaultSession = "gnome";
  programs.xwayland.enable = true;

  systemd.user.services.gnomeSettingsDaemon.enable = true;
  systemd.user.services.gnomeKeyring.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;

  # CUPS for printing
  # services.printing.enable = true;

  # User account (don't forget to set a password with ‘passwd’)
  users.users.chris = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      chris = import ../home;
    };
  };

  # Environment variables
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_QPA_PLATFORM = "wayland";

  # Nix packages configuration
  nixpkgs.config.allowUnfree = true;

  # Enabled programs
  programs.dconf.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.bash = {
    interactiveShellInit = ''
      set -o vi
    '';
  };
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };

  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
    # System
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    wl-clipboard
    adw-gtk3
    adwaita-fonts

    # Rust
    gcc
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    package-version-server

    # Nix
    nixd
    nil
    nixfmt-rfc-style

    # Essential
    syncthing
    ghostty
    syncthing

    # University
    openconnect

    # CLI
    wget
    glow

    # Apps
    papers
    clapper
    amberol
    metadata-cleaner
    tor-browser
    libreoffice-fresh
    obsidian
    # zed-editor
    signal-desktop
    freetube
    foliate
    hypnotix
    komikku
    gnome-podcasts
    shortwave
    blanket
  ];

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
    cheese
    eog
    epiphany
    evince
    geary
    gnome-console
    gnome-maps
    gnome-music
    gnome-weather
    gedit
    gnome-connections
    gnome-photos
    gnome-tour
    snapshot
    simple-scan
    totem
    yelp
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Maintenance automation
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Syncthing
  services.syncthing = {
    enable = true;
    group = "users";
    user = "chris";
    dataDir = "/home/chris";
    configDir = "/home/chris/.config/syncthing";
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
