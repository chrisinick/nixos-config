{
  ...
}:
{
  programs.firefox.policies.SearchEngines = {
    Default = "Ecosia";
    PreventInstalls = true;
    Remove = [
      "Bing"
      "eBay"
      "LEO Eng-Deu"
      "Perplexity"
      "Startpage"
    ];
    Add =
      let
        nixIconUrl = "https://search.nixos.org/images/nixos-logomark-default-gradient-none.svg";
        dictIconUrl = "https://www4.dict.cc/img/favicons/favicon4.png";
      in
      [
        {
          Name = "Ecosia";
          URLTemplate = "https://www.ecosia.org/search?q={searchTerms}";
          Method = "GET";
          Alias = "@ec";
        }
        {
          Name = "Nix Packages";
          URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
          Method = "GET";
          IconURL = nixIconUrl;
          Alias = "@np";
        }
        {
          Name = "Nix Options";
          URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
          Method = "GET";
          IconURL = nixIconUrl;
          Alias = "@no";
        }
        {
          Name = "NixOS Wiki";
          URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
          Method = "GET";
          IconURL = nixIconUrl;
          Alias = "@nw";
        }
        {
          Name = "Home Manager Options";
          URLTemplate = "https://home-manager-options.extranix.com/?release=master&query={searchTerms}";
          Method = "GET";
          IconURL = nixIconUrl;
          Alias = "@ho";
        }
        {
          Name = "dict.cc";
          URLTemplate = "https://www.dict.cc/?s={searchTerms}";
          Method = "GET";
          IconURL = dictIconUrl;
          Alias = "@di";
        }
      ];
  };
}
