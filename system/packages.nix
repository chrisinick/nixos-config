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
    adw-gtk3
    adwaita-fonts
    nerd-fonts.commit-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.comic-shanns-mono

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

    # Latex
    texliveMedium
    texlab
    zathura

    # Essential
    jq
    ffmpeg
    imagemagick
    ghostty
    cheese
    pinta
    gnome-tweaks

    # University
    openconnect

    # Work
    chromium
    openvpn
    remmina

    # CLI
    wget
    glow

    # Apps
    papers
    clapper
    celluloid
    amberol
    gnome-sound-recorder
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
