{
  ...
}:
{
  programs.firefox.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Router";
        url = "http://router.christophnickel.com/";
      }
      {
        name = "OMV";
        url = "http://server.christophnickel.com/";
      }
      {
        name = "Tailscale";
        url = "https://login.tailscale.com/admin/";
      }
      {
        name = "porkbun";
        url = "https://porkbun.com/account/domainsSpeedy/";
      }
      {
        name = "Filen";
        url = "https://filen.io/";
      }
      {
        name = "Rclone Web GUI";
        url = "http://127.0.0.1:36125/login";
      }
      "separator"
      {
        name = "Tuta";
        url = "https://app.tuta.com/";
      }
    ];
  };
}
