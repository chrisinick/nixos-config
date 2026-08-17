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
      sponsorBlockFiller = {
        color = "Blue";
        skip = "doNothing";
      };
      sponsorBlockInteraction = {
        color = "Blue";
        skip = "doNothing";
      };
      sponsorBlockIntro = {
        color = "Blue";
        skip = "doNothing";
      };
      sponsorBlockMusicOffTopic = {
        color = "Blue";
        skip = "doNothing";
      };
      sponsorBlockRecap = {
        color = "Blue";
        skip = "doNothing";
      };
      sponsorBlockSelfPromo = {
        color = "Blue";
        skip = "autoSkip";
      };
      sponsorBlockSponsor = {
        color = "Blue";
        skip = "autoSkip";
      };
    };
  };
}
