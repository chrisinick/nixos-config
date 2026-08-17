{
  pkgs,
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

    # Theme & Fonts
    adw-gtk3
    adwaita-fonts
    nerd-fonts.commit-mono

    # Gnome Extensions
    gnomeExtensions.appindicator

    # Nix
    nixd
    nil
    nixfmt

    # Rust
    gcc
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    package-version-server

    # Typst
    typst
    typstyle
    tinymist

    # Latex
    texliveMedium
    texlab
    zathura

    # CLI
    jq
    btop
    ffmpeg
    imagemagick
    wget
    curl
    glow
    fastfetch
    filen-cli

    # University
    openconnect
    networkmanager-openconnect

    # Work
    chromium
    openvpn
    networkmanager-openvpn
    remmina

    # Apps
    ghostty
    localsend
    cheese
    impression
    meld
    papers
    clapper
    celluloid
    amberol
    gnome-sound-recorder
    newsflash
    #metadata-cleaner
    tor-browser
    libreoffice-fresh
    obsidian
    zed-editor
    signal-desktop
    stremio-linux-shell
    freetube
    foliate
    hypnotix
    komikku
    gnome-podcasts
    shortwave
    blanket
    warp
    pinta
    rnote
    tutanota-desktop
    discord

    # Gaming
    protontricks
    heroic
    faugus-launcher
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
