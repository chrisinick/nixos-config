{
  ...
}:
{
  programs.firefox.policies = {
    ExtensionUpdate = false;
    InstallAddonsPermission.Default = false;

    ExtensionSettings =
      let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in
      {
        "*" = {
          installation_mode = "blocked";
          updates_disabled = true;
        };

        # Ublock origin
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
          default_area = "navbar";
          private_browsing = true;
        };

        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = moz "bitwarden-password-manager";
          installation_mode = "force_installed";
          updates_disabled = true;
          default_area = "navbar";
        };
      };

    # Ublock origin settings
    "3rdparty".Extensions."uBlock0@raymondhill.net".adminSettings = {
      userSettings.cloudStorageEnabled = false;

      userFilters = ''
        google.*##.g:has(a[href*="fandom.com"])
        google.*##a[href*="fandom.com"]:upward(1)
        duckduckgo.*##.g:has(a[href*="fandom.com"])
        duckduckgo.*##a[href*="fandom.com"]:upward(1)
        ecosia.*##.g:has(a[href*="fandom.com"])
        ecosia.*##a[href*="fandom.com"]:upward(1)
      '';

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
}
