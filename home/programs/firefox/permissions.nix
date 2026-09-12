{
  ...
}:
{
  programs.firefox.policies.Permissions =
    let
      allowList = [
        "https://teams.microsoft.com"
        "https://teams.cloud.microsoft"
        "https://discord.com"
        "https://web.whatsapp.com"
      ];
    in
    {
      Autoplay = {
        Locked = true;
        BlockNewRequests = true;
        Default = "block-audio";
      };
      Camera = {
        Locked = true;
        BlockNewRequests = false;
        Allow = allowList;
      };
      Microphone = {
        Locked = true;
        BlockNewRequests = false;
        Allow = allowList;
      };
      Location = {
        Locked = true;
        BlockNewRequests = true;
      };
      Notifications = {
        Locked = true;
        BlockNewRequests = true;
        Allow = allowList;
      };
      VirtualReality = {
        Locked = true;
        BlockNewRequests = true;
      };
      ScreenShare = {
        Locked = true;
        BlockNewRequests = false;
        Allow = allowList;
      };
    };
}
