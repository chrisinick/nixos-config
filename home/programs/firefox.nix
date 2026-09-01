{
  pkgs,
  ...
}:
{
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
      PasswordManagerEnabled = false;
      DisableMasterPasswordCreation = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      CrashReportsSubmit.Enabled = false;
      OfferToSaveLogins = false;
      browser.translations.automaticallyPopup = false;
      GenerativeAI.Chatbot = false;

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
    };
    profiles.default.search = {
      force = true;
      default = "ecosia";
      privateDefault = "ecosia";

      engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [
            "@np"
            "@nixpkgs"
          ];
        };

        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [
            "@no"
            "@nixoptions"
          ];
        };

        "NixOS Wiki" = {
          urls = [
            {
              template = "https://wiki.nixos.org/w/index.php";
              params = [
                {
                  name = "search";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [
            "@nw"
            "@nixwiki"
          ];
        };

        "Home Manager Options" = {
          urls = [
            {
              template = "https://home-manager-options.extranix.com";
              params = [
                {
                  name = "release";
                  value = "master";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [
            "@ho"
            "@homemanageroptions"
          ];
        };

        "ecosia" = {
          urls = [
            {
              template = "https://www.ecosia.org/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          definedAliases = [
            "@ec"
            "@ecosia"
          ];
        };
      };
    };
  };
}
