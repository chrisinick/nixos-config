{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./programs.nix
    ./packages.nix
  ];

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
      "networkmanager"
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

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs-unstable}" ];

  # Maintenance automation
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
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
