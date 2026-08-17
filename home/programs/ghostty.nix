{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      command = "${pkgs.fish}/bin/fish --login --interactive";
      shell-integration = "fish";
      cursor-style = "block";
      shell-integration-features = "no-cursor";
      theme = "dark:Adwaita Dark,light:Adwaita";
      font-family = "Commit Mono";
      window-width = 132;
      window-height = 43;
    };
  };
}
