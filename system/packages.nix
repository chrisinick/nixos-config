{
  config,
  lib,
  pkgs,
  stablePkgs,
  ...
}:
{
  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
    # System
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    wl-clipboard
    adw-gtk3
    adwaita-fonts

    # Nix
    nixd
    nil
    nixfmt-rfc-style

    # Rust
    gcc
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    package-version-server

    # Latex
    #texliveMedium
    #texlab
    #zathura

    # Arduino
    arduino-ide
    nodejs

    # Essential
    ffmpeg
    imagemagick
    syncthing
    ghostty
    cheese
    pinta

    # University
    openconnect

    # Work
    openvpn
    remmina
    chromium

    # CLI
    wget
    glow

    # Apps
    papers
    clapper
    celluloid
    amberol
    gnome-sound-recorder
    metadata-cleaner
    tor-browser
    libreoffice-fresh
    obsidian
    vscode
    zed-editor
    signal-desktop
    stremio
    freetube
    foliate
    hypnotix
    komikku
    gnome-podcasts
    shortwave
    blanket

    warp
    pixz
  ];

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
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
}
