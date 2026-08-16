{
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Christoph";
      user.email = "72564159+chrisinick@users.noreply.github.com";
      core.editor = "vim";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
