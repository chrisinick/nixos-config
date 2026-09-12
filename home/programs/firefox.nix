{
  config,
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
      RequestedLocales = [
        "de"
        "en-US"
      ];

      AIControls = {
        Default = {
          Value = "available";
          Locked = true;
        };
        SidebarChatbot = {
          Value = "blocked";
          Locked = true;
        };
        SpeechRecognition = {
          Value = "blocked";
          Locked = true;
        };
      };
      GenerativeAI = {
        Locked = true;
        Chatbot = false;
      };

      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };

      CaptivePortal = true;
      CNSA2KeyAgreementEnabled = true;
      PostQuantumKeyAgreementEnabled = true;
      SSLVersionMin = "tls1.2";

      Containers = {
        Default = [
          {
            name = "Home";
            icon = "globe";
            color = "gray";
          }
          {
            name = "Work";
            icon = "briefcase";
            color = "blue";
          }
        ];
      };

      Cookies = {
        Behavior = "partition-foreign";
        BehaviorPrivateBrowsing = "partition-foreign";
        Locked = true;
      };

      DefaultBrowserSettingEnabled = false;
      DontCheckDefaultBrowser = true;

      DownloadDirectory = "${config.home.homeDirectory}/Downloads";
      PromptForDownloadLocation = false;
      StartDownloadsInTempDirectory = false;

      DefaultSerialGuardSetting = 3;

      DisableAppUpdate = true;
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      ManualAppUpdateOnly = true;

      DisableTelemetry = true;
      CrashReportsSubmit.Enabled = false;
      ContentAnalysisTelemetry.Enabled = false;
      SecurityLogging = {
        AddonInstall.Enabled = false;
        BlocklistDomainBrowsed.Enabled = false;
        Download.Enabled = false;
        PrintPage.Enabled = false;
        UnsafeDownload.Enabled = false;
        UnsafeSiteVisit.Enabled = false;
      };

      DisableAccounts = true;
      DisableFirefoxAccounts = true;
      Sync.Enabled = false;

      DisableMasterPasswordCreation = true;
      PrimaryPassword = false;
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;
      MicrosoftEntraSSO = false;
      WindowsSSO = false;

      DisableBuiltinPDFViewer = false;
      PDFjs = {
        Enabled = true;
        EnablePermissions = false;
      };
      PrintingEnabled = true;
      UseSystemPrintDialog = false;

      DisableDefaultBrowserAgent = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableLaunchOnLogin = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;

      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      ShowHomeButton = false;

      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://dns.quad9.net/dns-query";
        Locked = true;
        ExcludedDomains = [ "christophnickel.com" ];
        Fallback = true;
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Category = "strict";
        BaselineExceptions = true;
        ConvenienceExceptions = false;
      };
      HttpsOnlyMode = "force_enabled";
      DisableSecurityBypass = {
        InvalidCertificate = false;
        SafeBrowsing = false;
      };
      GoToIntranetSiteForSingleWordEntryInAddressBar = false;
      IPProtectionAvailable = false;
      LocalNetworkAccess = {
        Enabled = true;
        Locked = true;
        BlockTrackers = true;
        EnablePrompting = true;
      };
      PrivateBrowsingModeAvailability = 0;

      SearchSuggestEnabled = false;
      VisualSearchEnabled = false;

      EncryptedMediaExtensions = {
        Enabled = true;
        Locked = true;
      };
      HardwareAcceleration = true;

      NetworkPrediction = true;

      Proxy.Locked = true;

      PictureInPicture = {
        Enabled = true;
        Locked = true;
      };

      PopupBlocking = {
        Default = true;
        Locked = true;
      };

      TranslateEnabled = true;

      FirefoxSuggest = {
        Locked = true;
        WebSuggestions = false;
        SponsoredSuggestions = false;
        OnlineEnabled = false;
      };
      UserMessaging = {
        Locked = true;
        SkipOnboarding = true;
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        MoreFromMozilla = false;
        FirefoxLabs = false;
      };

      Permissions = {
        Autoplay = {
          Locked = true;
          BlockNewRequests = true;
          Default = "block-audio";
        };
        Camera = {
          Locked = true;
          BlockNewRequests = false;
          Allow = [
            "https://teams.microsoft.com"
            "https://teams.cloud.microsoft"
            "https://discord.com"
            "https://web.whatsapp.com"
          ];
        };
        Microphone = {
          Locked = true;
          BlockNewRequests = false;
          Allow = [
            "https://teams.microsoft.com"
            "https://teams.cloud.microsoft"
            "https://discord.com"
            "https://web.whatsapp.com"
          ];
        };
        Location = {
          Locked = true;
          BlockNewRequests = true;
        };
        Notifications = {
          Locked = true;
          BlockNewRequests = true;
          Allow = [
            "https://teams.microsoft.com"
            "https://teams.cloud.microsoft"
            "https://discord.com"
            "https://web.whatsapp.com"
          ];
        };
        VirtualReality = {
          Locked = true;
          BlockNewRequests = true;
        };
        ScreenShare = {
          Locked = true;
          BlockNewRequests = false;
          Allow = [
            "https://teams.microsoft.com"
            "https://teams.cloud.microsoft"
            "https://discord.com"
            "https://web.whatsapp.com"
          ];
        };
      };

      Homepage = {
        Locked = true;
        URL = "about:blank";
        StartPage = "previous-session";
        NewTabOnRestore = false;
      };
      NewTabPage = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      SkipTermsOfUse = true;
      SanitizeOnShutdown.Locked = true;
      FirefoxHome = {
        Locked = true;
        Search = false;
        Weather = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Widgets = {
          Enabled = false;
          Blocked = [
            "clocks"
            "crossword"
            "focusTimer"
            "lists"
            "pictureOfTheDay"
            "privacy"
            "recentSearches"
            "sportsWidget"
            "stocks"
            "weather"
          ];
        };
      };

      ExtensionUpdate = true;
      InstallAddonsPermission.Default = false;
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*" = {
            installation_mode = "blocked";
            updates_disabled = "false";
          };

          # Ublock origin
          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = "false";
            default_area = "navbar";
            private_browsing = true;
          };

          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = moz "bitwarden-password-manager";
            installation_mode = "force_installed";
            updates_disabled = "false";
            default_area = "navbar";
          };
        };

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

      NoDefaultBookmarks = true;
      # TODO
      ManagedBookmarks = [ ];
    };

    profiles.default = {
      settings = {
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "browser.uiCustomization.state" = {
          "placements" = {
            "widget-overflow-fixed-list" = [ ];
            "unified-extensions-area" = [ ];
            "nav-bar" = [
              "sidebar-button"
              "back-button"
              "forward-button"
              "stop-reload-button"
              "customizableui-special-spring1"
              "vertical-spacer"
              "firefox-view-button"
              "alltabs-button"
              "urlbar-container"
              "customizableui-special-spring2"
              "downloads-button"
              "reset-pbm-toolbar-button"
              "ai-window-toggle"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
            ];
            "toolbar-menubar" = [ "menubar-items" ];
            "TabsToolbar" = [ ];
            "vertical-tabs" = [ "tabbrowser-tabs" ];
            "PersonalToolbar" = [ "personal-bookmarks" ];
          };
          "currentVersion" = 26;
          "newElementCount" = 4;
        };
        "browser.download.autohideButton" = false;

        "browser.translations.automaticallyPopup" = false;
        "browser.translations.neverTranslateLanguages" = "de,en";
      };

      search = {
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

          "dict.cc" = {
            urls = [
              {
                template = "https://www.dict.cc";
                params = [
                  {
                    name = "s";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [
              "@di"
              "@dictcc"
            ];
          };
        };
      };
    };
  };
}
