{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Christoph";
    userEmail = "72564159+chrisinick@users.noreply.github.com";
    extraConfig = {
      core = {
        editor = "vim";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
