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
          userSettings.cloudStorageEnabled = false;
          filters = [
            "google.*##.g:has(a[href*=\"fandom.com\"])"
            "google.*##a[href*=\"fandom.com\"]:upward(1)"
            "duckduckgo.*##.g:has(a[href*=\"fandom.com\"])"
            "duckduckgo.*##a[href*=\"fandom.com\"]:upward(1)"
            "ecosia.*##.g:has(a[href*=\"fandom.com\"])"
            "ecosia.*##a[href*=\"fandom.com\"]:upward(1)"
          ];
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-unbreak"
            "ublock-quick-fixes"
            "ublock-cookies-adguard"
            "ublock-cookies-easylist"
            "ublock-annoyances"
            "adguard-generic"
            "adguard-cookies"
            "adguard-mobile"
            "adguard-popup-overlays"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-widgets"
            "adguard-spyware-url"
            "adguard-social"
            "easylist"
            "easylist-annoyances"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "fanboy-cookiemonster"
            "fanboy-social"
            "fanboy-thirdparty_social"
            "fanboy-ai-suggestions"
            "block-lan"
            "easyprivacy"
            "urlhaus-1"
            "curben-phishing"
            "dpollock-0"
            "plowe-0"
            "DEU-0"
          ];
        };
      };
    };
  };
}
