{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.freetube = {
    enable = true;
    settings = {
      barColor = false;
      checkForUpdates = false;
      defaultQuality = "1440";
      defaultViewingMode = "theatre";
      displayVideoPlayButton = false;
      expandSideBar = true;
      externalPlayer = "clapper";
      hideHeaderLogo = true;
      hideLabelsSideBar = false;
      mainColor = "Blue";
      region = "DE";
      rememberSearchHistory = false;
      sponsorBlockSelfPromo = {
        color = "Yellow";
        skip = "autoSkip";
      };
      uiScale = 120;
      unsubscriptionPopupStatus = true;
      useRssFeeds = true;
      useSponsorBlock = true;
    };
  };
}
