{
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
      hideHeaderLogo = true;
      hideLabelsSideBar = false;
      mainColor = "Blue";
      region = "DE";
      rememberSearchHistory = false;
      uiScale = 110;
      unsubscriptionPopupStatus = true;
      useRssFeeds = true;
      useSponsorBlock = true;
      sponsorBlockSelfPromo = {
        color = "Yellow";
        skip = "autoSkip";
      };
    };
  };
}
