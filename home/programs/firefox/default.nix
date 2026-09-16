{
  config,
  ...
}:
{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./permissions.nix
    ./search-engines.nix
    ./ui-customization.nix
  ];

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

      SanitizeOnShutdown.Locked = true;
    };

    profiles.default.settings = {
      "browser.translations.automaticallyPopup" = false;
      "browser.translations.neverTranslateLanguages" = "de,en";
    };
  };
}
