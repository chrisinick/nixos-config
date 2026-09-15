{
  pkgs,
  ...
}:
{
  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
    # System
    sbctl
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    wl-clipboard
    easyeffects
    firefox

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
    ripgrep
    fd
    bat
    eza
    jq
    btop
    ffmpeg
    imagemagick
    wget
    curl
    magic-wormhole
    glow
    fastfetch
    rclone

    # University
    openconnect
    networkmanager-openconnect
    zotero

    # Work
    openvpn
    networkmanager-openvpn
    remmina

    # Cosmic desktop
    cutecosmic
    cosmic-ext-ctl
    cosmic-ext-tweaks
    cosmic-viewer
    cosmic-ext-calculator
    cosmic-ext-applet-minimon
    cosmic-ext-applet-weather
    cosmic-ext-applet-privacy-indicator
    cosmic-ext-applet-external-monitor-brightness

    # Gnome apps
    gnome-font-viewer
    gnome-characters
    gnome-sound-recorder
    gnome-podcasts
    snapshot

    # Apps
    tutanota-desktop
    ghostty
    warp
    impression
    meld
    newsflash
    metadata-cleaner
    tor-browser
    libreoffice
    zed-editor
    signal-desktop
    stremio-linux-shell
    freetube
    foliate
    hypnotix
    komikku
    shortwave
    blanket
    warp
    pinta
    rnote
    discord

    # Gaming
    protontricks
    heroic
    faugus-launcher
    (prismlauncher.override { jdks = [ jdk25 ]; })
  ];

  fonts.packages = with pkgs; [
    adwaita-fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    jetbrains-mono
    commit-mono
  ];

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
    eog
    epiphany
    evince
    geary
    gedit
    gnome-connections
    gnome-console
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-tour
    gnome-weather
    simple-scan
    totem
    yelp
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
