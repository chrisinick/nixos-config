{
  lib,
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.git.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true; # for emojis in firefox
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
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];
    policies = {
      # Updates & background services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # Feature disabling
      DisableFirefoxStudies = true;
      DisableMasterPasswordCreation = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      CrashReportsSubmit.Enabled = false;
      OfferToSaveLogins = false;
      browser.translations.automaticallyPopup = false;

      # Extensions
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*".installation_mode = "blocked";

          # Ublock origin
          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
          };

          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = moz "bitwarden-password-manager";
            installation_mode = "force_installed";
          };

          # Dark reader
          "addon@darkreader.org" = {
            install_url = moz "darkreader";
            installation_mode = "force_installed";
          };
        };

      # Extension configuration
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = rec {
            uiTheme = "dark";
            cloudStorageEnabled = lib.mkForce false;

            importedLists = [
              "https://filters.adtidy.org/extension/ublock/filters/3.txt"
              "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            ];

            externalLists = lib.concatStringsSep "\n" importedLists;
          };

          selectedFilterLists = [
            "CZE-0"
            "adguard-generic"
            "adguard-annoyance"
            "adguard-social"
            "adguard-spyware-url"
            "easylist"
            "easyprivacy"
            "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            "plowe-0"
            "ublock-abuse"
            "ublock-badware"
            "ublock-filters"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "urlhaus-1"
          ];
        };
      };
    };
  };
}
