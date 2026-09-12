{
  ...
}:
{
  programs.firefox = {
    policies = {
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
    };

    profiles.default.settings = {
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
    };
  };
}
